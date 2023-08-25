#!/bin/bash

my_laptop_external_monitor=$(xrandr --query | grep 'HDMI-1')

if [[ $my_laptop_external_monitor = *connected* ]]; then
    xrandr --output eDP-1 --primary --auto --rotate normal --output HDMI-1 --auto --rotate normal --right-of eDP-1
fi
