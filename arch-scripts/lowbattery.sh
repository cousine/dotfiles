#!/bin/bash
#
# low battery warning
#

BATTERY=/sys/class/power_supply/BAT0

#REM=`grep "POWER_SUPPLY_ENERGY_NOW" $BATTERY/uevent | awk -F= '{ print $2 }'`
#FULL=`grep "POWER_SUPPLY_ENERGY_FULL_DESIGN" $BATTERY/uevent | awk -F= '{ print $2 }'`
STATUS=`grep "POWER_SUPPLY_STATUS" $BATTERY/uevent | awk -F= '{ print $2 }'`
#PERCENT=`echo $(( $REM * 100 / $FULL ))`
PERCENT=`cat /sys/class/power_supply/BAT0/capacity`

THRESHOLD=10
if [[ $PERCENT -le $THRESHOLD  && $STATUS != "Charging" ]]; then
  /usr/bin/dunstify -u 2 -i battery -t 0 -a battery "Low battery" "Battery level at ${PERCENT}%"
fi
