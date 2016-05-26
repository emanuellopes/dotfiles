#!/bin/bash

status="nothing"

if [ $1 == "up" ] ; then
    pulseaudio-ctl up
    status='UP'
elif [ $1 == "down" ] ; then
    pulseaudio-ctl down
    status='DOWN'
elif [ $1 == "mute" ] ; then
    pulseaudio-ctl mute
    staudio=`amixer get Master | awk -F'[]%[]' '/%/ {print $5}' | tail -n 1`
    if [ "$staudio" == "off" ] ; then
    	status="MUTE"
    else
    	status="UNMUTE"
   	fi
else
	exit 1;
fi

sound=`amixer get Master | awk -F'[]%[]' '/%/ {if ($5 == "off"){print 0"%"}else {print $2"%"}}' | tail -n 1`

notify-send -a "SOUND" "$status - Volume $sound"