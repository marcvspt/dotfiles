#!/usr/bin/bash

workdir="$HOME/Imágenes/Wallpapers/"
img=$(/usr/bin/ls "$workdir")
lockfile="/tmp/bspwm-bg.lock"

if [[ -f "$lockfile" ]]; then
    exit 0
fi

/usr/bin/touch "$lockfile"

while true; do
    random=$(echo "$img" | /usr/bin/shuf -n 1)
    background="$workdir$random"
    /usr/bin/feh --bg-fill "$background"
    /usr/bin/sleep 1800
done
