#!/bin/bash

basedir="/sys/class/backlight/"
handler=$basedir$(ls $basedir)"/"
current_brightness=$(cat $handler"brightness")
new_brightness=$(($current_brightness $1))

notify-send -t 1 -a Brilho $new_brightness
echo $new_brightness | sudo /usr/bin/tee $handler"brightness"
