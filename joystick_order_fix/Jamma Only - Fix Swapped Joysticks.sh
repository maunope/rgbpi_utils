#!/bin/bash
echo "Backup existing autostart script"
if [[ ! -e /opt/rgbpi/BACKUPautostart.sh ]]; then
  cp ./scripts/autostart.sh /opt/rgbpi/BACKUPautostart.sh
else
  echo "Warning: /opt/rgbpi/BACKUPautostart.sh already exists. Not overwriting."
fi
echo "Installing fix script"
if [[ ! -e /opt/rgbpi/ui/fix_joystick_order.py ]]; then
  cp ./scripts/fix_joystick_order.py  /opt/rgbpi/ui/
else
  echo "Warning: /opt/rgbpi/ui/fix_joystick_order.py already exists. Not overwriting."
fi
echo "The fix will be active on next reboot"
