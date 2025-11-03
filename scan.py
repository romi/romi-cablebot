import time
from romi.cnc import CNC
from romi.camera import Camera
from romi.battery import Battery
from sacred import Experiment
from sacred.observers import FileStorageObserver
import json
from datetime import datetime
import os
from multiprocessing import Process
import smtplib, ssl
import time

# Sacred experiment setup
exp = Experiment('midori')
exp.observers.append(FileStorageObserver('midori'))

results_json = 'experiment_results.json'



def sendmail(title, body):
    port = 465
    smtp_server = "smtpauth.online.net"
    sender_email = "romi@hanappe.com"
    receiver_email = "peter.hanappe@sony.com"
    password = "CEuMplD3"
    message = f'Subject: {title}\r\n\r\n{body}'
    context = ssl.create_default_context()
    with smtplib.SMTP_SSL(smtp_server, port, context=context) as server:
        server.login(sender_email, password)
        server.sendmail(sender_email, receiver_email, message)



def wait_timeout(proc, seconds):
    """Wait for a process to finish, or raise exception after timeout"""
    start = time.time()
    end = start + seconds
    interval = min(seconds / 1000.0, .25)

    while True:
        result = proc.poll()
        if result is not None:
            return result
        if time.time() >= end:
            raise RuntimeError("Process timed out")
        time.sleep(interval)

def readConfigurationFile() -> dict:
    with open("conf.json", 'r') as file:
        data = json.load(file)
    if data == None:
        raise ValueError("No configuration file found")
    return data


def readScan(data):
    try:
        scan = data["scan"]
        count = int(scan["count"])
        start = float(scan["start"])
        interval = float(scan["interval"])
        speed = float(scan["speed"])
    except KeyError:
        raise Exception("Missing Information from the configuration file")
    
    return count, start, interval, speed


def readHoming(data):
    try:
        scan = data["scan"]
        homing = bool(scan["homing"])
    except KeyError:
        raise Exception("Missing Information from the configuration file")
    return homing


@exp.config
def my_config():
    data = readConfigurationFile()
    if data is None:
        raise Exception("ERROR_CONFIG_FILE")
   
    
def startup_cnc(cnc):
    # 5V on the NC pin: True turns off battery recharging
    cnc.set_relay(0, True)
    cnc.power_up()

    
@exp.capture
def try_scan(timeout_seconds):
    success = False
    p = Process(target=scan_in_background)
    p.start()
    try:
        wait_process(p, timeout_seconds)
        success = True
    except Exception as e:
        sendmail('*** Midori: Scan failed ***', f'{e}')
        print(f"Experiment failed: {e}")
        p.kill()
    finally:
        p.join()
    return success


def wait_process(process, seconds):
    """Wait for a process to finish, or raise exception after timeout"""
    start = time.time()
    end = start + seconds
    interval = min(seconds / 1000.0, 1)

    alive = True
    while alive:
        time.sleep(interval)
        if time.time() >= end:
            raise RuntimeError("Process timed out")
        alive = process.is_alive()
    

def scan_in_background():
    cnc = CNC.create("cnc")
    camera = Camera.create("camera")
    camera.power_up()
    startup_cnc(cnc)
    scan(cnc, camera, readConfigurationFile())
    shutdown_cnc(cnc, readConfigurationFile())
    camera.power_down()


def scan(cnc, camera, data):
    count, start, interval, speed = readScan(data) 
    for i in range(count + 1):
        x = start + i * interval
        cnc.moveto(x, 0, 0, 0.75)
        time.sleep(1)
        image = camera.grab()
        if image is not None:
            filename = f"cablebot-{i:05d}-{int(1000*x)}.jpg"
            print(f"Saving {filename}")
            image.save(filename)

            # Get today's data as metric
            today_date = datetime.now().strftime("%Y-%m-%d")
            today_time = datetime.now().strftime("%H:%M:%S")
            exp.log_scalar("date", today_date)
            exp.log_scalar("time", today_time)
            exp.log_scalar("filename", filename)

            # Add the picture to Mongo through an artifact
            exp.add_artifact(filename, filename)

            # Add position as metrics
            tmp = dict(cnc.get_position())
            exp.log_scalar("X", tmp['x'])
            exp.log_scalar("Y", tmp['y'])
            exp.log_scalar("Z", tmp['z'])

            # Remove the temporary save
            os.remove(filename)

            
@exp.capture
def shutdown_cnc(cnc, data):
    homing = readHoming(data)
    if homing:
        cnc.moveto(0.04, 0, 0, 0.75)
        cnc.homing()
    else:
        cnc.moveto(0.0, 0, 0, 0.75)
    cnc.power_down()
    # 5V on the NC pin: False turns on battery recharging
    cnc.set_relay(0, False)


def shutdown_camera(camera):
    camera.power_down()


def charge_battery():
    cnc = CNC.create("cnc")
    # 5V on the NC pin: False turns on battery recharging
    cnc.set_relay(0, False)

    
def wait_charge_battery():
    success = False
    p = Process(target=charge_battery)
    p.start()
    try:
        wait_process(p, 60)
        success = True
    except Exception as e:
        print(f"Setting battery relay failed: {e}")
        p.kill()
    finally:
        p.join()
    return success


def try_charge_battery_once():
    charge_battery()
    time.sleep(5)
    return is_charging()


def try_charge_battery():
    success = False
    attempts = 0
    for attempts in range(12):
        success = try_charge_battery_once()
        if success:
            break
        else:
            redo_homing()
    if success:
        sendmail('*** Midori: Battery is charging ***', f'{attempts+1} attempts')
    else:
        sendmail('*** Midori: Failing to charge the battery ***', 'Tried hard, though')

        
def redo_homing():
    cnc = CNC.create("cnc")
    cnc.set_relay(0, True)
    cnc.power_up()
    cnc.moveto(0.04, 0, 0, 0.75)
    cnc.homing()
    cnc.power_down()
    cnc.set_relay(0, False)

    
def initResultsJson():
    if not os.path.exists(results_json):
        with open(results_json, 'w') as f:
            json.dump([], f)


def writeResultsJson(run_id, success):
    result = {
        'id': run_id,
        'complete': success,
        'copied': False
    }
    
    with open(results_json, 'r') as f:
        data = json.load(f)
    
    data.append(result)
    
    with open(results_json, 'w') as f:
        json.dump(data, f, indent=4)


def is_charging():
    battery = Battery.create('battery')
    status = battery.get_status()
    return status['charging'] or status['charged']



@exp.automain
def main(_run):
    initResultsJson()
    # Try running a scan. If after 10 minutes the scan is not
    # finished, the try_scan will return an error flag.
    experiment_success = try_scan(10 * 60) 
    writeResultsJson(_run._id, experiment_success)
    # Make sure the battery recharge relay is on, even in case the
    # scan failed, otherwise the camera will run out of battery.
    try_charge_battery()
