#!/bin/bash

#Script to check battery level
export $(egrep -z DBUS_SESSION_BUS_ADDRESS /proc/$(pgrep -u $LOGNAME gnome-session)/environ)

battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
if [ $battery_level -le 60 ]
then
    notify-send "Battery low" "Battery level is ${battery_level}%!"
elif [ $battery_level -ge 90]
then
	notify-send "Battery full" "Battery level is ${battery_level}%!"
else
	notify-send "Battery Level is ${battery_level}%!"
fi
