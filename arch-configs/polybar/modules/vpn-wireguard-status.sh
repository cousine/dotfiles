#!/bin/sh

printf "" & nmcli --overview connection show cousine-wireguard-vpn | grep "GENERAL.STATE" | cut -d ':' -f 2 | awk '{ gsub(/ /,""); print }'
