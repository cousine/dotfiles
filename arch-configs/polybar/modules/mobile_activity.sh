#!/bin/bash

if [ ! -f "/tmp/mobile_broadband_mode.dat" ] ; then
  modem_mode="off"
else
  modem_mode=`cat /tmp/mobile_broadband_mode.dat`
fi

if [ $modem_mode = "on" ]; then
  MODEM=`mmcli -L | grep -o /org/freedesktop/ModemManager1/Modem/[0-9]* | head -1`
  STATUS=`mmcli -m $MODEM --simple-status`

  state=`echo $STATUS | sed -n "s/.*\(state: '[a-zA-Z0-9 +_-]*'\).*/\1/gp" | sed -n "s/.*'\(.*\)'.*/\1/gp"`
  if [[ $state -eq "connected" ]]; then
    quality=`echo $STATUS | sed -n "s/.*\(signal quality: '[a-zA-Z0-9 +_-]*'\).*/\1/gp" | sed -n "s/.*'\(.*\)'.*/\1/gp"`
    connection=`echo $STATUS | sed -n "s/.*\(access tech: '[a-zA-Z0-9 +_-]*'\).*/\1/gp" | sed -n "s/.*'\(.*\)'.*/\1/gp"`
    operator=`echo $STATUS | sed -n "s/.*\(operator name: '[a-zA-Z0-9 +_-]*'\).*/\1/gp" | sed -n "s/.*'\(.*\)'.*/\1/gp"`

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
      quality_symbol=""
    elif [[ $quality -lt 50 ]]; then
      quality_symbol=""
    else
      quality_symbol=""
    fi

    echo "$quality_symbol $connection_symbol $operator"
  fi
else
  exit
fi
