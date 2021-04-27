// Romi cablebot MK2 motor controller

#include <PID_v1.h>

/////////////////////////////////////////////////////////////////////////
// ## Configuration
enum { INPUT_RC, INPUT_SERIAL };
enum { CONTROL_PID, CONTROL_DIRECT };

unsigned char inputMode = INPUT_RC;
unsigned char controlMode = CONTROL_PID;

/////////////////////////////////////////////////////////////////////////
// ## Debug

int debug = 1;
#define debug_print(__x)  if (debug) Serial.print(__x)
#define debug_println(__x)  if (debug) Serial.println(__x)
#define debug_print_float(__x,__y)  if (debug) Serial.print(__x,__y)
#define debug_print_name_value(__s, __v) if (debug) { Serial.print(__s); Serial.print(" "); Serial.println(__v); }


// Suported motors
#define DFROBOT_MOTOR 0
#define ODRIVE_5055 1

#define USED_MOTOR ODRIVE_5055

/////////////////////////////////////////////////////////////////////////
// ## Brushless DC motor https://wiki.dfrobot.com/FIT0441_Brushless_DC_Motor_with_Encoder_12V_159RPM
#if USED_MOTOR == DFROBOT_MOTOR

#define PIN_MOTOR_1_PWM 9
#define PIN_MOTOR_3_DIR 6
#define PIN_MOTOR_4_FG 8

// Encoders
volatile bool encoderPinState;
volatile long encoderTicks;
volatile int dir;
long prevEncoderTicks = 0;

// Reduction ratio: 45:1
// 6 pulses per rotation → 45 * 6 = 270 pulses per rotation.
float stepsPerRevolution = 270.0f;
const float maxSpeed = 2.4f;
float absoluteSpeed;
float smoothAbsoluteSpeed;

#endif

/////////////////////////////////////////////////////////////////////////
// ## Brushless motor Turnigy Aerodrive SK3 - 5055-280kv (https://hobbyking.com/es_es/turnigy-aerodrive-sk3-5055-280kv-brushless-outrunner-motor.html)
// ## with Odrive controler (https://github.com/odriverobotics/ODrive)
// ## and AMT102 encoder 8192 ticks (https://www.cuidevices.com/product/resource/digikeypdf/amt10.pdf)

#if USED_MOTOR == ODRIVE_5055


#endif

const unsigned int SPEED_ALPHA = 5; // 0-10 - small values -> more smooth and big values more close to original data.

// The PID controllers that manage the motor speeds.
// The target, the input speed, and the output signal are measured
// between [-1,1].
double pidInput;
double pidOutput;
double pidTarget;

// TODO do tests to find out correct PID values and erase this (leave a sane default)
//PID values: K[Kp, Ki, Kd]
//echo K[80,1200,0]

// The PID controllers. The Kp, Ki, and Kd values must be set with
// using the 'K' command.
PID pid(&pidInput, &pidOutput, &pidTarget, 0.1, 4, 0.01, DIRECT);

/////////////////////////////////////////////////////////////////////////
// ## Remote control

/* #define PIN_RC_SPEED 6 */
#define PIN_RC_SPEED 3
const unsigned int RC_ALPHA = 2; // 0-10 - small values -> more smooth and big values more close to original data.
//const unsigned int RC_CALIBRATION[3] = {8828, 12164, 15200}; // Min, Middle and Max values to calibrate the remote
const unsigned int RC_CALIBRATION[3] = {1104, 1520, 1900}; // Min, Middle and Max values to calibrate the remote
const unsigned int RC_THRESHOLD = (RC_CALIBRATION[1] - RC_CALIBRATION[0]) / 2;
volatile unsigned long rcTimerSpeed;
volatile long rcSpeed = 0;
long rcSmoothSpeed;
bool rcUpdated;


/////////////////////////////////////////////////////////////////////////
// ## Endstops
# define PIN_ENDSTOP_FRONT 4
# define PIN_ENDSTOP_BACK 5
volatile bool endStopFront = false;
volatile bool endStopBack = false;



// TODO Semi-automatic calibration routine

void rcInterrupt()
{
	if (digitalRead(PIN_RC_SPEED)) {

		rcTimerSpeed = micros();

	} else {

		if (rcTimerSpeed != 0) {
			// Record the pulse time
			rcSpeed = micros() - rcTimerSpeed;
			// Restart the timer
			rcTimerSpeed = 0;
			rcUpdated = true;
		}
	}
}

void setup()
{
#if USED_MOTOR == DFROBOT_MOTOR
	//---------------------------------------------- Set PWM frequency for D5 & D6 -------------------------------
	//NOTE: Changing this timer 0 affects millis() and delay!
	//TCCR0B = TCCR0B & B11111000 | B00000001;    // set timer 0 divisor to     1 for PWM frequency of 62500.00 Hz
	//TCCR0B = TCCR0B & B11111000 | B00000010;    // set timer 0 divisor to     8 for PWM frequency of  7812.50 Hz
	//TCCR0B = TCCR0B & B11111000 | B00000011;    // set timer 0 divisor to    64 for PWM frequency of   976.56 Hz (The DEFAULT)
	//TCCR0B = TCCR0B & B11111000 | B00000100;    // set timer 0 divisor to   256 for PWM frequency of   244.14 Hz
	//TCCR0B = TCCR0B & B11111000 | B00000101;    // set timer 0 divisor to  1024 for PWM frequency of    61.04 Hz

	//---------------------------------------------- Set PWM frequency for D9 & D10 ------------------------------
	TCCR1B = TCCR1B & (B11111000 | B00000001);    // set timer 1 divisor to     1 for PWM frequency of 31372.55 Hz
	//TCCR1B = TCCR1B & B11111000 | B00000010;    // set timer 1 divisor to     8 for PWM frequency of  3921.16 Hz
	//TCCR1B = TCCR1B & B11111000 | B00000011;    // set timer 1 divisor to    64 for PWM frequency of   490.20 Hz (The DEFAULT)
	//TCCR1B = TCCR1B & B11111000 | B00000100;    // set timer 1 divisor to   256 for PWM frequency of   122.55 Hz
	//TCCR1B = TCCR1B & B11111000 | B00000101;    // set timer 1 divisor to  1024 for PWM frequency of    30.64 Hz

	// Motor control setup
	pinMode(PIN_MOTOR_3_DIR, OUTPUT);
	pinMode(PIN_MOTOR_4_FG, INPUT_PULLUP);
	digitalWrite(PIN_MOTOR_1_PWM, HIGH); // Start with motor stopped
	digitalWrite(PIN_MOTOR_3_DIR, HIGH);


	// Motor encoder setup
	// Code taken from https://playground.arduino.cc/Main/PinChangeInterrupt/
	*digitalPinToPCMSK(PIN_MOTOR_4_FG) |= bit (digitalPinToPCMSKbit(PIN_MOTOR_4_FG)); // enable pin
	PCIFR  |= bit (digitalPinToPCICRbit(PIN_MOTOR_4_FG)); // clear any outstanding interrupt
	PCICR  |= bit (digitalPinToPCICRbit(PIN_MOTOR_4_FG)); // enable interrupt for the group
#endif

	encoderTicks = 0;
	prevEncoderTicks = 0;

	Serial.begin(115200);

	// Remote control interrupt setup
	/* *digitalPinToPCMSK(PIN_RC_SPEED) |= bit (digitalPinToPCMSKbit(PIN_RC_SPEED)); // enable pin */
	/* PCIFR  |= bit (digitalPinToPCICRbit(PIN_RC_SPEED)); // clear any outstanding interrupt */
	/* PCICR  |= bit (digitalPinToPCICRbit(PIN_RC_SPEED)); // enable interrupt for the group */
	attachInterrupt(digitalPinToInterrupt(PIN_RC_SPEED), rcInterrupt, CHANGE);
	rcTimerSpeed = 0;
	rcSmoothSpeed = 0;
	rcUpdated = false;

	// Endstops interrupt setup
	pinMode(PIN_ENDSTOP_FRONT, INPUT_PULLUP);
	*digitalPinToPCMSK(PIN_ENDSTOP_FRONT) |= bit (digitalPinToPCMSKbit(PIN_ENDSTOP_FRONT)); // enable pin
	PCIFR  |= bit (digitalPinToPCICRbit(PIN_ENDSTOP_FRONT)); // clear any outstanding interrupt
	PCICR  |= bit (digitalPinToPCICRbit(PIN_ENDSTOP_FRONT)); // enable interrupt for the group
	pinMode(PIN_ENDSTOP_BACK, INPUT_PULLUP);
	*digitalPinToPCMSK(PIN_ENDSTOP_BACK) |= bit (digitalPinToPCMSKbit(PIN_ENDSTOP_BACK)); // enable pin
	PCIFR  |= bit (digitalPinToPCICRbit(PIN_ENDSTOP_BACK)); // clear any outstanding interrupt
	PCICR  |= bit (digitalPinToPCICRbit(PIN_ENDSTOP_BACK)); // enable interrupt for the group

        pid.SetMode(AUTOMATIC);
        pid.SetSampleTime(50);
        pid.SetOutputLimits(-1.0, 1.0);
}

void stop()
{
        setOutputSignal(0);
	pidTarget = 0;
}

inline void setOutputSignal(float value)
{
	// Set desired direction
	if (value < 0) {
		digitalWrite(PIN_MOTOR_3_DIR, LOW);
		dir = -1;
	} else {
		digitalWrite(PIN_MOTOR_3_DIR, HIGH);
		dir = 1;
	}

	// If PWM signal is exactly 0 encoder is disabled, this means that we can not detect forced motor rotation when on rest state (we can use positional encoder or IMU to react)
	int writeSignal = abs(abs(value * 255) - 255);
	analogWrite(PIN_MOTOR_1_PWM, writeSignal);

	/* debug_print_name_value("signal: ", writeSignal); */
}

void switchToSerialInput()
{
        stop();
        inputMode = INPUT_SERIAL;
}

void switchToRCInput()
{
        stop();
        inputMode = INPUT_RC;
}

void switchToDirectControl()
{
        stop();
        controlMode = CONTROL_DIRECT;
}

void switchToPIDControl()
{
        stop();
        /* lastLeftInput = 0; */
        /* lastRightInput = 0; */
        controlMode = CONTROL_PID;
}

void handleRemoteControl()
{
	if (rcUpdated) {

		rcSmoothSpeed = rcSmoothSpeed + (RC_ALPHA * (rcSpeed - rcSmoothSpeed) / 10);
		rcUpdated = false;
		/* debug_print(rcSmoothSpeed); */
		/* debug_print(","); */
		/* debug_println(rcSpeed); */


		float speed;
		// Map the RC inputs to [-1, 0]
		if (rcSmoothSpeed < RC_CALIBRATION[1]) speed = map(rcSmoothSpeed, RC_CALIBRATION[0], RC_CALIBRATION[1], -1000, 0) / 1000.0f;

                // Or map the RC inputs to [0, 1]
		else speed = map(rcSmoothSpeed, RC_CALIBRATION[1], RC_CALIBRATION[2], 0, 1000) / 1000.0f;


                // Filter out small noise in the PWM around zero
                float delta1 = 0.03f;
                if (-delta1 < speed && speed < delta1) speed = 0.0f;

		/* debug_print_name_value("speed: ", speed); */

		// Set the target speed
                if (controlMode == CONTROL_PID) pidTarget = speed;

		// Or Set the output signal directly
                else setOutputSignal(speed);
	}

	/* debug_print_name_value("pidTarget: ", pidTarget); */
}

void handleSerialInput()
{
	if (Serial.available() <= 0) return;

	float speed = Serial.parseInt() / 1000.0f;

	if (speed > 1 || speed < -1) return;

	// Filter out small noise in the PWM around zero
	float delta1 = 0.03f;
	if (-delta1 < speed && speed < delta1) speed = 0.0f;

	Serial.print("setting speed to ");
	Serial.println(speed);

	// Set the target speed
	if (controlMode == CONTROL_PID) pidTarget = speed;

	// Or Set the output signal directly
	else setOutputSignal(speed);
}

inline void measureCurrentSpeed()
{
        static unsigned long lastTime = 0;
        unsigned long t = millis();

        if (t > lastTime + 50) {
                float dt = (t - lastTime) / 1000.0;

                absoluteSpeed = (encoderTicks - prevEncoderTicks) / dt / stepsPerRevolution;

		// Exponential smoothing to avoid noise at slow speed
		smoothAbsoluteSpeed = smoothAbsoluteSpeed + (SPEED_ALPHA * (absoluteSpeed - smoothAbsoluteSpeed) / 10);

		// TODO
		// Calculate pidInput:%s
                // pidInput = absoluteSpeed / maxSpeed;
                // pidInput = 0.2 * pidInput + 0.8 * lastPidInput;
		// pidInput should be between -1 and 1

                pidInput = smoothAbsoluteSpeed / maxSpeed;


                prevEncoderTicks = encoderTicks;
                lastTime = t;

		/* debug_print_name_value("AbsoluteSpeed: ", absoluteSpeed); // In revolutions per second */
	}
}

void updateOutputSignal()
{
        measureCurrentSpeed();

        if (controlMode == CONTROL_PID) {

                // Check for updates from the PID
                if (pid.Compute()) {

			/* debug_print_name_value("pidTarget: ", pidTarget); */
			/* debug_print_name_value("pidInput: ", pidInput); */
			/* debug_print_name_value("pidOutput: ", pidOutput); */

			debug_print(pidTarget);
			debug_print(",");
			debug_print(pidInput);
			debug_print(",");
			debug_println(pidOutput);


                        // Force small outputs to zero when the target is zero
                        if (pidTarget == 0 && pidOutput > -0.1 && pidOutput < 0.1) pidOutput = 0.0;

                        setOutputSignal(pidOutput);
                }
        }
}

void emergencyStop()
{
	// TODO
	// revisar la dirección del error (front o back)
	// Evitar que el PID haga moverse mas al bot despues de desctivado el switch
	// Regresar un poco el motor cuando chocamos con algo
	// Revisar el codigo del rover para pensar en como manejar el error

	stop();

	// Set speed in oposite direction
	if (endStopFront) {
		Serial.println("Crashed on front!!");
		pidTarget = -0.3;
	} else { 
		Serial.println("Crashed on back!!");
		pidTarget = 0.3;
	}

	if (controlMode == CONTROL_DIRECT) setOutputSignal(pidTarget);

	// Move slowly for one second
	uint32_t timer = millis();
	while (millis() - timer < 1000) updateOutputSignal();

	stop();

	endStopFront = false;
	endStopBack = false;
}

void loop()
{
	if (endStopBack || endStopFront) {
		/* debug_println("Crashed!!!"); */
		emergencyStop();
		return;
	}

	switch (inputMode) {

		case INPUT_RC:

			if (Serial.available() && Serial.read() == 115) {
				debug_println("Switching to serial control");
				switchToSerialInput();
			}

			handleRemoteControl();
			break;

		case INPUT_SERIAL:

			// As a safety measure, if someone is pulling the RC sticks,
			// give the control back to the RC emitter.
			// TODO is jumping to RC control without RC connected
			if (abs(rcSpeed - RC_CALIBRATION[1]) > RC_THRESHOLD && rcSpeed != 0 && rcSpeed < RC_CALIBRATION[2] && rcSpeed > RC_CALIBRATION[0]) {

				debug_println("Switching to remote control");
				Serial.println(rcSpeed);

				switchToRCInput();
				delay(3000); // Check if this is needed

			} else {

				handleSerialInput();

			}

			break;
	}


	updateOutputSignal();

	/* debug_print_name_value("encoder: ", encoderTicks); */
}

// Interrupt for pins D0-D7
ISR(PCINT2_vect)
{
	// ISR (PCINT0_vect) pin change interrupt for D8 to D13
	// ISR (PCINT1_vect) pin change interrupt for A0 to A5
	// ISR (PCINT2_vect) pin change interrupt for D0 to D7


	if (!digitalRead(PIN_ENDSTOP_BACK) != endStopBack) {

		static uint32_t last_endStopBack_interrupt_time = 0;
		uint32_t interrupt_time = millis();
	
		if (interrupt_time - last_endStopBack_interrupt_time > 100) {
			endStopBack = !endStopBack;
			last_endStopBack_interrupt_time = interrupt_time;
		}
		
	}
	if (!digitalRead(PIN_ENDSTOP_FRONT) != endStopFront) {

		static uint32_t last_endStopFront_interrupt_time = 0;
		uint32_t interrupt_time = millis();
	
		if (interrupt_time - last_endStopFront_interrupt_time > 100) {
			endStopFront = !endStopFront;
			last_endStopFront_interrupt_time = interrupt_time;
		}
	}
}

// Interrupt for pins D8-D13
ISR(PCINT0_vect)
{
// Esto debería de funcionar eliminando encoderPinState y solo dando un tick cuando not digitalRead, hay que probarlo
	if (digitalRead(PIN_MOTOR_4_FG)) {
		encoderPinState = true;
	} else {
		if (encoderPinState == 1) {
			encoderTicks += dir;
			encoderPinState = false;
		}
	}
}

