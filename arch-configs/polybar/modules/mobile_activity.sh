#!/bin/bash

if [ ! -f "/tmp/mobile_broadband_mode.dat" ] ; then
  modem_mode="off"
else
  modem_mode=`cat /tmp/mobile_broadband_mode.dat`
fi

if [ $modem_mode = "on" ]; then
  MODEM=`mmcli -L | grep -o /org/freedesktop/ModemManager1/Modem/[0-9]* | head -1`
  if [ -z $MODEM ]; then
    echo " Modem not connected"
    exit
  fi

  STATUS=`mmcli -m $MODEM -K`

  state=`echo $STATUS | tr '\n' ';' | sed -n "s/.*modem.generic.state\s*: \([a-zA-Z0-9 +_-]*\)\s.*/\1/gp"`
  if [[ $state -eq "connected" ]]; then
    quality=`echo $STATUS | tr '\n' ';' | sed -n "s/.*modem.generic.signal-quality.value\s*: \([a-zA-Z0-9 +_-]*\)\s.*/\1/gp"`
    connection=`echo $STATUS | tr '\n' ';' | sed -n "s/.*modem.generic.access-technologies.value\[1\]\s*: \([a-zA-Z0-9 +_-]*\)\s.*/\1/gp"`
    operator=`echo $STATUS | tr '\n' ';' | sed -n "s/.*modem.3gpp.operator-name\s*: \([a-zA-Z0-9 +_-]*\)\s.*/\1/gp"`

    case "$connection" in
      lte )
        connection_symbol="ﰒ"
        ;;
      hspa )
        connection_symbol="ﰓ"
        ;;
      edge )
        connection_symbol="ﰐ"
        ;;
      hspa+ )
        connection_symbol="ﰔ"
        ;;
      *)
        connection_symbol=""
    esac

    if [[ $quality -lt 30 ]]; then
      quality_symbol=""
    elif [[ $quality -lt 50 ]]; then
      quality_symbol="ﯜ"
    else
      quality_symbol=""
    fi

    echo "$quality_symbol $connection_symbol $operator"
  fi
else
  exit
fi
