#!/usr/bin/bash

my_laptop_external_monitor=$(/usr/bin/xrandr --query | /usr/bin/grep 'HDMI-1')

if [[ $my_laptop_external_monitor = *connected* ]]; then
    /usr/bin/xrandr --output eDP-1 --primary --auto --rotate normal --output HDMI-1 --auto --rotate normal --right-of eDP-1
fi
