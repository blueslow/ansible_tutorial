#!/bin/bash
MOSPUB="/usr/bin/mosquitto_pub"
BROKER="raspberrypi3w.sehlstedt.se"
BPORT="1883"
TOPIC="home-assistant/office/sw1"

#Get the BUSER and BPWD
source mosquitto.pwd

/usr/bin/touch /tmp/pma.txt
echo "pmon $@ : $TOPIC" >>/tmp/pma.txt

if [ "$#" = "1" ]; then
    $MOSPUB -h $BROKER -p $BPORT -u $BUSER -P $BPWD -t $TOPIC -m $1
    /usr/bin/sleep 1
    $MOSPUB -h $BROKER -p $BPORT -u $BUSER -P $BPWD -t $TOPIC -m $1
    if [ "$1" = "0" ]; then
	/usr/bin/touch /tmp/opma.txt
	echo "pmon $@ : $TOPIC" >>/tmp/opma.txt
    fi
else
    echo "$MOSPUB -h $BROKER -p $BPORT -u $BUSER -P $BPWD -t $TOPIC -m "
    echo "Argument missing, e.g. 1 or 0."
fi

