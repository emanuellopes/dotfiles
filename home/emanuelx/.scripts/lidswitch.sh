#! /bin/sh
#
# lidswitch.sh
#
# Disable/Enable suspension when closing laptop lid

SERVICE='systemd-inhibit'
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
	notify-send "Yes" -a "Suspend on Close Lid" &
	pkill systemd-inhibit &
else
	notify-send "No" -a "Suspend on Close Lid" &
	systemd-inhibit --what=handle-lid-switch sleep 25920000 &
fi