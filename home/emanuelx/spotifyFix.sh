#!/bin/sh
LD_PRELOAD=libcurl.so.3 /usr/share/spotify/spotify --force-device-scale-factor=1.0000001 "$@"
