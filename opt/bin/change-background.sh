#!/bin/bash

workdir="$HOME/Imágenes/Wallpapers/"
img=$(/bin/ls "$workdir")
lockfile="/tmp/bspwm-bg.lock"

if [[ -f "$lockfile" ]]; then
    exit 0
fi

touch "$lockfile"

while true; do
    random=$(echo "$img" | shuf -n 1)
    background="$workdir$random"
    feh --bg-fill "$background"
    sleep 1800
done
