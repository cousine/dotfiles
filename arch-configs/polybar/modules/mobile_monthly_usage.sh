#!/bin/bash

if [ ! -f "/tmp/mobile_broadband_mode.dat" ] ; then
  modem_mode="off"
else
  modem_mode=`cat /tmp/mobile_broadband_mode.dat`
fi

if [ $modem_mode = "on" ]; then
  rx=`vnstat -q -i ppp0 --json m 1 | jq '.interfaces[0].traffic.month[0].rx'`
  tx=`vnstat -q -i ppp0 --json m 1 | jq '.interfaces[0].traffic.month[0].tx'`
  total=$(($rx + $tx))
  echo $total | awk '{suffix=" KMGT"; for(i=1; $1>1024 && i < length(suffix); i++) $1/=1024; printf("%.2f%s", $1, substr(suffix, i, 1));}'
else
  exit
fi

