import pyudev
import pygame
import sys
import os
import time
import subprocess

joyOk=False
giveUp=False
attempts=0
maxAttemps=10

while joyOk==False and giveUp==False:
    #Load joypi and init joys
    subprocess.run(['modprobe','-r', 'joypi'])
    subprocess.run(['modprobe', 'joypi'])
    pygame.joystick.quit()
    pygame.joystick.init()

    context = pyudev.Context()
    devices = context.list_devices(subsystem='tty')
    for device in pyudev.Context().list_devices(subsystem='input'): 
        is_joystick = '/dev/input/js' in device.get('DEVNAME', 'None')
        if is_joystick:
            if 'input10' in  device.device_path  and 'js1' in device.device_path:
                attempts+=1
                print("fix_joystick_order.py attempting to fix joystick order, found js1 on devicepath ",device.device_path," attempt #",attempts, file=sys.stderr)
                joyOk=False
                if attempts>=maxAttemps:
                    giveUp=True
                break
        joyOk=True