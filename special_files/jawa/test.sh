#!/bin/sh

# place this script in  /usr/lib/systemd/system-shutdown
# and set execution bit
if [ "$1" = "poweroff" ] ; then
    /root/bin/dotest.sh 0
fi

