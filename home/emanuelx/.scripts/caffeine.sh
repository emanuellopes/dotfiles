#!/bin/bash
DPMS=$(xset q | grep "DPMS is Disabled")
echo $DPMS
if [ "$DPMS" == "" ]; then
	xset s 0 0
	xset s noblank
	xset -dpms
	notify-send -a "Caffeine Mode" "Enabled"
else
	xset s 0 600
	xset s blank
	xset +dpms
	notify-send -a "Caffeine Mode" "Disabled"
fi;
