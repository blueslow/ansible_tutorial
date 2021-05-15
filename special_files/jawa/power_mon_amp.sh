#!/bin/bash
MOSPUB="/usr/bin/mosquitto_pub"
BROKER="raspberrypi3w.sehlstedt.se"
BPORT="1883"
BUSER="homeassistant"
BPWD="ieth6xohBea3leijiePhohc8nai9oht9bief5bahkohJaif9eiJohx1aingahj3I"
TOPIC="home-assitant/office/sw1"

if [ "$#" = "1" ]; then
    $MOSPUB -h $BROKER -p $BPORT -u $BUSER -P $BPWD -t $TOPIC -m $1
else
    echo "$MOSPUB -h $BROKER -p $BPORT -u $BUSER -P $BPWD -t $TOPIC -m "
    echo "Argument missn 1 or 0."
fi

