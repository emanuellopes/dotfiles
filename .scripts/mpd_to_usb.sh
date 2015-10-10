 #!/bin/bash
 #$destiny="/home/bruno/Documentos/AscendSD"
 #cat ~/.config/mpd/playlists/Favoritas.m3u | grep -v '#' | \
 #while read i; do cp "/home/bruno/Música/${i}" "/home/bruno/Documentos/AscendSD"; done 

cp "/home/bruno/Música/$(mpc -f %file% | head -n 1)" "/run/media/bruno/FF5A-7FEE"
