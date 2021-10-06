#!/bin/bash
set -e
set -x
if [ -z "$USER" -o -z "$UID" ]; then
    echo "USER NOT DEFINED"
    exit 1
fi
if [ -z "$GROUP" -o -z "$GID" ]; then
    echo "GROUP NOT DEFINED"
    exit 1
fi

SERVICES="/bin/dbus-uuidgen --ensure;/bin/dbus-daemon --system --fork"

rm -f /var/run/dbus/pid > /dev/null 2>&1
sleep 1

IFS=';'
for s in $SERVICES; do
    echo $s
    screen -d -m bash -x -c $s
done
addgroup --quiet --gid ${GID} ${GROUP} || true
adduser  --quiet --home /home/${USER} --shell /bin/false --gecos "UserAccount" --uid ${UID} --ingroup ${GROUP} --disabled-password --disabled-login ${USER} || true

if [ ! -L '/root/HGR' ]; then
    ln -s /home/${USER} /root/HGR || true
fi

if [ ! -L '/root/HGR-SERVER' ]; then
    ln -s /home/${USER} /root/HGR-SERVER || true
fi

export LANG=es_ES.UTF-8

#screen -d -m
/usr/bin/cga-hgr-client
chown -R $USER:$GROUP /home/${USER} || true



