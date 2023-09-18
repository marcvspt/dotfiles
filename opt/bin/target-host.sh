#!/usr/bin/bash

# Colors
declare -r color_white="%{F#ffffff}"
declare -r color_red="%{F#e51d0b}"

# Symbols
declare -r symbol_target="${color_red}󰓾 "

# Data
declare -r host="$(/usr/bin/cat /opt/help/target 2>/dev/null | /usr/bin/awk '{print $1}')"
declare -r name="$(/usr/bin/cat /opt/help/target 2>/dev/null | /usr/bin/awk '{print $2}')"

if [[ $host ]] && [[ $name ]]; then
    echo -e "${symbol_target} ${color_white}$host - $name"
else
    echo -e "${symbol_target} ${color_white}No target"
fi
