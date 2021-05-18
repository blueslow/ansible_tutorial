#!/bin/bash
MOSPUB="/usr/bin/mosquitto_pub"
BROKER="raspberrypi3w.sehlstedt.se"
BPORT="1883"
TOPIC="home-assistant/office/sw2"

#Get the BUSER and BPWD
source mosquitto.pwd

if [ "$#" = "1" ]; then
    $MOSPUB -h $BROKER -p $BPORT -u $BUSER -P $BPWD -t $TOPIC -m $1
    /usr/bin/sleep 1
    $MOSPUB -h $BROKER -p $BPORT -u $BUSER -P $BPWD -t $TOPIC -m $1
else
    echo "$MOSPUB -h $BROKER -p $BPORT -u $BUSER -P $BPWD -t $TOPIC -m "
    echo "Argument missing, e.g.  1 or 0."
fi

