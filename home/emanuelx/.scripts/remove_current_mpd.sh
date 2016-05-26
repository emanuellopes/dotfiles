#!/bin/bash

song_to_remove=$(mpc | head -n 1)
playlist_pos=$(mpc -f %position% | head -n 1)
#Delete the song
rm "$(mpc -f %file% | head -n 1 | sed 's/^/\/home\/bruno\/Música\//')"
#Remove the song from playlist
mpc del $playlist_pos
