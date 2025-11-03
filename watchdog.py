import time
from datetime import datetime
import os
import json
import smtplib, ssl
from romi.cnc import CNC
from romi.camera import Camera
from romi.battery import Battery


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


def try_charge_battery():
    success = False
    attempts = 0
    for attempts in range(12):
        success = try_charge_battery_once()
        if success:
            break
        else:
            redo_homing()
    return success, attempts

        
def try_charge_battery_once():
    success = False
    try:
        charge_battery()
        time.sleep(5)
        return is_charging()
    except:
        print('try_charge_battery_once failed')
    return success
        

def charge_battery():
    cnc = CNC.create("cnc")
    # 5V on the NC pin: False turns on battery recharging
    cnc.set_relay(0, False)


def redo_homing():
    cnc = CNC.create("cnc")
    cnc.set_relay(0, True)
    cnc.power_up()
    cnc.moveto(0.04, 0, 0, 0.75)
    cnc.homing()
    cnc.power_down()
    cnc.set_relay(0, False)


def try_get_battery_status():
    status = None
    try:
        status = get_battery_status()
    except:
        status = None
    return status


def get_battery_status():
    battery = Battery.create('battery')
    status = battery.get_status()
    return status


def is_charging():
    status = get_battery_status()
    return is_status_charging(status)


def is_status_charging(status):
    return status['charging'] or status['charged']


def get_voltage(status):
    return status['voltage']


def is_camera_online():
    result = False
    response = os.system(f"ping -c 1 cablebot-camera.local")
    if response == 0:
        result = True
    return result


if not is_camera_online():
    sendmail('*** Watchdog: Camera offline ***', '')
        
else:
    status = try_get_battery_status()
    if status == None:
        sendmail('*** Watchdog: Battery offline ***', '')

    elif not is_status_charging(status):
        voltage = get_voltage(status)
        success, attempts = try_charge_battery()
        if success:
            sendmail(f'*** Watchdog: Charging OK {voltage:.2f} V ***', f'{attempts+1} attempts')
        else:
            sendmail(f'*** Watchdog: Charging failing {voltage:.2f} V ***', '')
    else:
        voltage = get_voltage(status)
        sendmail(f'*** Watchdog: OK, {voltage:.2f} V  ***', '')
