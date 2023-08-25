#!/bin/bash

# Colors
declare -r color_white="%{F#ffffff}"
declare -r color_purple="%{F#d764ff}"

# Symbols
declare -r symbol_vpn="${color_purple}󰅟 "

# Interaces
declare -r iface_vpn="$(/usr/bin/ifconfig tun0 2>/dev/null | grep 'inet ' | awk '{print $2}')"


if [[ $iface_vpn ]]; then
    echo -e "${symbol_vpn} ${color_white}$iface_vpn"
else
    echo -e "${symbol_vpn} ${color_white}Disconnected"
fi
