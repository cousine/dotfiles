#!/bin/bash

if [ ! -f "/tmp/docker_mode.dat" ] ; then
  docker_mode="off"
else
  docker_mode=`cat /tmp/docker_mode.dat`
fi

if [ $docker_mode != "on" ]; then
  exit -1
else
  exit 0
fi
