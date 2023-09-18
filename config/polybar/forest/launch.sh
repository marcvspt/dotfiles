#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/forest"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
polybar -q main -c "$DIR"/config.ini &

my_laptop_external_monitor=$(/usr/bin/xrandr --query | /usr/bin/grep 'HDMI-1')
if [[ $my_laptop_external_monitor != *disconnected* ]]; then
  polybar secondary -c "$DIR"/config.ini &
fi
