#include "State.h"

State::State()
        : state(STATE_STARTING_UP),
          error(ERROR_NONE),
          error_message("")
{
}

void State::init()
{
	FastLED.addLeds<NEOPIXEL, PIN_ADDR_LED>(leds, NUM_LEDS);
        set(STATE_STARTING_UP);
}

void State::set(DeviceState s)
{
        Serial.print("State: ");
        Serial.println(state);        
        state = s;
        update_leds();
}

void State::set_error(DeviceError err, const char *message)
{
        error = err;
        error_message = message;
        set(STATE_ERROR);
        Serial.print("Error: ");
        Serial.println(message);
}

void State::clear_error()
{
        set(STATE_READY); // TODO: is this right?
        error = ERROR_NONE;
        error_message = "";
}

void State::update_leds()
{
        switch (state) {
        case STATE_ERROR:
                update_error_leds();
                break;
        case STATE_STARTING_UP:
                set_leds(CRGB::Blue, CRGB::Black, CRGB::Black);
                break;
        case STATE_INITIALIZING_DEBUG_SERIAL:
                set_leds(CRGB::Blue, CRGB::Blue, CRGB::Black);
                break;
        case STATE_INITIALIZING_CAMERA_SERIAL:
                set_leds(CRGB::Blue, CRGB::Blue, CRGB::Blue);
                break;
        case STATE_INITIALIZING_ODRIVE:
                set_leds(CRGB::Orange, CRGB::Black, CRGB::Black);
                break;
        case STATE_INITIALIZING_POSITION:
                set_leds(CRGB::Orange, CRGB::Orange, CRGB::Black);
                break;
        case STATE_INITIALIZING_SWITCHES:
                set_leds(CRGB::Orange, CRGB::Orange, CRGB::Orange);
                break;
        case STATE_READY:
                set_leds(CRGB::Green, CRGB::Black, CRGB::Black);
                break;
        }
}

void State::update_error_leds()
{
        switch (error) {
        case ERROR_NONE:
                // Should never happen!
                set_leds(CRGB::Green, CRGB::Black, CRGB::Black);
                break;
        case ERROR_ODRIVE:
                set_leds(CRGB::Red, CRGB::Black, CRGB::Black);
                break;
        }
}

void State::set_leds(const struct CRGB &color0,
                     const struct CRGB &color1,
                     const struct CRGB &color2)
{
        leds[0] = color0;
        leds[1] = color1;
        leds[2] = color2;        
        FastLED.show();
}

