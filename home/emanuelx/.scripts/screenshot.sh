!#/bin/bash
gnome-screenshot -f $(xdg-user-dir PICTURES)/screenshot_$(date +%F_%H-%M-%S).png
notify-send -a Scrot Screenshot
