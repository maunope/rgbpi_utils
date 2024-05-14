#!/bin/bash
echo "Restoring autostart backup"
if [[ ! -e /opt/rgbpi/BACKUPautostart.sh ]]; then
  echo "Warning: /opt/rgbpi/BACKUPautostart.sh doesn't exist. can't restore original file"
else
 cp /opt/rgbpi/BACKUPautostart.sh /opt/rgbpi/autostart.sh
 rm /opt/rgbpi/BACKUPautostart.sh
fi

echo "Removing fix script"
if [[ ! -e /opt/rgbpi/ui/fix_joystick_order.py ]]; then
  echo "Warning: /opt/rgbpi/ui/fix_joystick_order.py doesn't exist. Nothing to do."
else
  rm /opt/rgbpi/ui/fix_joystick_order.py
fi
echo "Removal complete"







