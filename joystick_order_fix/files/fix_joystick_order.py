import pyudev
import pygame
import sys
import os
import subprocess

JoyOk=False
GiveUp=False
Attempts=0
MaxAttemps=10

while JoyOk==False and GiveUp==False:
    #Load joypi and init joys
    subprocess.run(['modprobe','-r', 'joypi'])
    subprocess.run(['modprobe', 'joypi'])
    pygame.joystick.quit()
    pygame.joystick.init()

    devices = pyudev.Context().list_devices(subsystem='tty')
    for device in pyudev.Context().list_devices(subsystem='input'): 
        is_joystick = '/dev/input/js' in device.get('DEVNAME', 'None')
        if is_joystick:
            #check if sorting is wrong, swaps happen when joysticks take numbers 9 and 10, as 10 comes before 9 in lexical sorting
            if 'input10' in  device.device_path  and 'js1' in device.device_path:
                Attempts+=1
                print("fix_joystick_order.py attempting to fix joystick order, found js1 on devicepath ",device.device_path," attempt #",Attempts, file=sys.stderr)
                JoyOk=False
                if Attempts>=MaxAttemps:
                    print("fix_joystick_order.py giving up, too many attempts, js1 and js2 will remain swapped for this boot", file=sys.stderr)
                    GiveUp=True
                break
        JoyOk=True