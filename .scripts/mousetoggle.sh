#!/bin/bash
#hide mouse

MOUSE=`synclient -l | grep TouchpadOff | tr -s [:space:] | cut -d' ' -f4`

echo $MOUSE

if (($MOUSE == 0)); then
	synclient TouchpadOff=1
	notify-send "Disable Touchpad" -a "touchpad"  
else
	synclient TouchpadOff=0
	notify-send "Enable Touchpad" -a "touchpad"  
fi
 echo $MOUSE
