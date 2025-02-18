#!/usr/bin/bash

# Colors
declare -r color_white="%{F#ffffff}"
declare -r color_blue="%{F#00e4FF}"

# Symbols
declare -r symbol_eth="${color_blue}󰈀 "
declare -r symbol_wifi_connected="${color_blue}󰖩 "
declare -r symbol_wifi_disconnected="${color_blue}󰖪 "

# Interaces
declare -r iface_eth="$(/usr/sbin/ifconfig eth0 2>/dev/null | /usr/bin/grep 'inet ' | /usr/bin/awk '{print $2}')"
declare -r iface_wifi="$(/usr/sbin/ifconfig wlan0 2>/dev/null | /usr/bin/grep 'inet ' | /usr/bin/awk '{print $2}')"

if [[ $iface_eth ]]; then
	echo -e "${symbol_eth} ${color_white}$iface_eth"
elif [[ $iface_wifi ]]; then
	echo -e "${symbol_wifi_connected} ${color_white}$iface_wifi"
else
	echo -e "${symbol_wifi_disconnected} ${color_white}!!!"
fi
