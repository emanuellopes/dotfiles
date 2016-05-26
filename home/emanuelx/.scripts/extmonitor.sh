#!/bin/bash
if [ $1 == "he" ] ; then
    xrandr --output DP1 --auto
    xrandr --output HDMI1 --auto --left-of LVDS1
elif [ $1 == "hd" ] ; then
    xrandr --output DP1 --auto
    xrandr --output HDMI1 --auto --right-of LVDS1
elif [ $1 == "ho" ] ; then
    xrandr --output HDMI1 --off
    xrandr --output DP1 --auto
elif [ $1 == "hr" ] ; then
    xrandr --output HDMI1 --off
    xrandr --output DP1 --on
elif [ $1 == "vl" ]; then
	xrandr --output VGA1 --auto --left-of LVDS1
elif [ $1 == "vr" ]; then
	xrandr --output VGA1 --auto --right-of LVDS1 
elif [ $1 == "vo" ]; then
	xrandr --output VGA1 --off
	xrandr --output DP1 --auto
fi