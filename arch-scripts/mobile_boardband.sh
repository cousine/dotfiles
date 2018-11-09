#!/bin/bash
# if we don't have a file, start at zero
if [ ! -f "/tmp/mobile_broadband_mode.dat" ] ; then
  modem_mode="off"
else
  modem_mode=`cat /tmp/mobile_broadband_mode.dat`
fi

if [ $modem_mode = "off" ]; then
  sudo systemctl start ModemManager.service
  modem_mode="on"
else
  sudo systemctl stop ModemManager.service
  modem_mode="off"
fi
echo "Broadband: ${modem_mode}"
echo "${modem_mode}" > /tmp/mobile_broadband_mode.dat