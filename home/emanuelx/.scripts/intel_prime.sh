#!/bin/bash

# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
if [ $# -eq 0 ]
  then
  	echo "use intel_prime.sh [intel| nvidia]";
    exit 1;
fi

if [ $1 == "nvidia" ] ; then
	echo "Changing to nvidia...";
	echo "update xorg.conf...";

	if [ ! -f /etc/X11/xorg.conf.nvidia ]; then
    	echo "xorg.conf.nvidia not found exit script...";
    	exit 1;
	fi

	cp /etc/X11/xorg.conf.nvidia /etc/X11/xorg.conf
	echo "delete 20-intel.conf...";

	if [ -f /etc/X11/xorg.conf.d/20-intel.conf ]; then
    	rm /etc/X11/xorg.conf.d/20-intel.conf
	fi
	prime-select nvidia
elif [[ $1 == "intel" ]]; then
	echo "Changing to intel...";
	echo "delete nvidia xorg.conf...";
	if [ -f /etc/X11/xorg.conf ]; then
    	rm /etc/X11/xorg.conf
	fi

	echo "Update 20-intel.conf ...";
	if [ ! -f /etc/X11/xorg.conf.d/20-intel.conf.bak ]; then
    	echo "20-intel.conf.bak not found exit script...";
    	exit 1;
	fi
    cp /etc/X11/xorg.conf.d/20-intel.conf.bak /etc/X11/xorg.conf.d/20-intel.conf
    prime-select intel
else
	echo "bad arguments";
fi