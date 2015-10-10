#!/bin/bash

if [ $1 == "next" ] ; then
	playerctl next
elif [ $1 == "previous" ] ; then
	playerctl previous
elif [ $1 == "toggle" ] ; then
	playerctl play-pause
fi

