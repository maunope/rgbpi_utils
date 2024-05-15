# joystick_order_fix
Some python magic to address the pesky "swapped joysticks" issue plaguing RGBPI Jamma cards: approximately once every 10 boots (YMMV) Joystick 1 and Joystick 2
get swapped, often causing game menu button to stop working as a side effect. This script checks joysticks ordering before RGBPI ui starts, and fixes it if required.

## Prerequisites:

- Root access to RGBPI OS is required, you can use rgbpi_extras to get it (https://github.com/sd2cv/RGBPi-Extra/)

## Current capabilities:
- Fixes joystick swaps at boot on RGBPI Jamma cards
- Logs to `/opt/rgbpi/ui/logs/error.log` if order fixing was required

## How to use:
- **ONLY USE WITH RGBPI JAMMA CARDS** this script hasn't been tested on any othe device, plus, it's only useful there
- installer installs, uninstaller uninstalls. fix will be effective from next reboot.


## Todo:
-  ~~prepare install/uninstall scripts~~

