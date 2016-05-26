#!/bin/bash
if [ -n "$1" ]; then
	if [ $1 == "start" ] ; then
		sudo modprobe nvidia_drm
		sudo modprobe nvidia_modeset
		sudo modprobe nvidia
		sudo tee /proc/acpi/bbswitch <<<ON
		cat /proc/acpi/bbswitch

		exit 0
	fi
fi

sudo rmmod nvidia_drm
sudo rmmod nvidia_modeset
sudo rmmod nvidia
sudo tee /proc/acpi/bbswitch <<<OFF
cat /proc/acpi/bbswitch
