# joystick_order_fix
Some python magic to address the pesky "swapped joysticks" issue plaguing RGBPI Jamma cards: approximately once every 10 boots (YMMV) Joystick 1 and Joystick 2
get swapped, often causing game menu button to sto working as a side effect. This script checks joysticks ordering before RGBPI ui starts, and fixes it if required.

## Prerequisites:

- Root access to rgbpi is required, you can use rgbpi_extras to get it (https://github.com/sd2cv/RGBPi-Extra/)

## Current capabilities:
- Fixes joystick swaps at boot on RGBPI Jamma cards
- Logs to /opt/rgbpi/ui/logs/error.log if order fixing was required

## How to use:
- **ONLY USE WITH RGBPU JAMMA CARDS** this script hasn't been tested on any othe device, plus, it's only useful there
- copy fix_joystick_order.py to /opt/rgbpi/ui/, backup /opt/rgbpi/autostart.sh and replace it with autostart.sh from this repo, enjoy consisten joystick assignment :-) 


## Todo:
- prepare install/uninstall scripts
