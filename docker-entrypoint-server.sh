#!/bin/bash

SERVICES="/bin/dbus-uuidgen --ensure;/bin/dbus-daemon --system --fork"

rm -f /var/run/dbus/pid > /dev/null 2>&1
sleep 1

IFS=';'
for s in $SERVICES; do
    echo $s
    screen -d -m bash -x -c $s
done

export LANG=es_ES.UTF-8

#screen -d -m
/usr/bin/cga-hgr-server

chown -R $USER:$GROUP /home/${USER} || true
