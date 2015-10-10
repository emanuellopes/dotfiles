!#/bin/bash
scrot $(xdg-user-dir PICTURES)/%Y-%m-%d_%H:%M:%S.png
notify-send -a Scrot Screenshot
