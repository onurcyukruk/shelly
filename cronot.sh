#!/bin/sh
# Using notify-send with cron. First apt install libnotify-bin
# Put this script in your ~/bin/ dir. chmod +x cronot.sh
# in your crontab * * * * * cronot.sh "hello world"

if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then 
    if [ -z "$LOGNAME" ]; then
        EUID=$(id -u)
    else
        EUID=$(id -u "$LOGNAME")
    fi
    [ -z $EUID ] && exit

    if [ -S /run/user/$EUID/bus ]; then
        export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$EUID/bus"
    else
        SESSION=$(loginctl -p Display show-user "$LOGNAME" | cut -d= -f2)
        [ -z "$SESSION" ] && exit
        LEADER=$(loginctl -p Leader show-session "$SESSION" | cut -d= -f2)
        [ -z $LEADER ] && exit
        OLDEST=$(pgrep -o -P $LEADER)
        [ -z $OLDEST ] && exit
        export $(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$OLDEST/environ)
        [ -z "$DBUS_SESSION_BUS_ADDRESS" ] && exit
    fi
fi
notify-send "$@" &&
beep

 
