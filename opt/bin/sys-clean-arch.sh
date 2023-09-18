#!/usr/bin/bash

# Globarl vars
## Colors
declare -r colors_init="\e[" # Initialization

### Options
declare -r txt_regul="${colors_init}0"
declare -r txt_bold="${colors_init}1"

### Base colors
declare -r color_red=";31m"
declare -r color_green=";32m"
declare -r color_yellow=";33m"
declare -r color_blue=";34m"
declare -r color_purple=";35m"
declare -r color_white=";37m"

declare -r colors_end="${txt_regul}m" # RESET-END COLORS

### Bold text colors
declare -r col_txt_bld_red="${txt_bold}${color_red}"
declare -r col_txt_bld_grn="${txt_bold}${color_green}"
declare -r col_txt_bld_ylw="${txt_bold}${color_yellow}"
declare -r col_txt_bld_blu="${txt_bold}${color_blue}"
declare -r col_txt_bld_pur="${txt_bold}${color_purple}"
declare -r col_txt_bld_wht="${txt_bold}${color_white}"

## Symbols
declare -r symbol_error="${col_txt_bld_red}[x]"
declare -r symbol_progress="${col_txt_bld_ylw}[#]"
declare -r symbol_interrupted="${col_txt_bld_blu}[!]"
declare -r symbol_completed="${col_txt_bld_grn}[*]"

# Ctrl + c función
function signal_handler() {
    echo -e "\n${symbol_interrupted} Exiting${colors_end}\n"
    /usr/bin/tput cnorm
    exit 1
}

## Redirigir Ctrl + C a una función
trap signal_handler INT

# Main
/usr/bin/tput civis
if [ $EUID -eq 0 ]; then
    /usr/bin/pacman -Rscn $(/usr/bin/paru -Qtdq)
    /usr/bin/pkgfile -u
    /usr/bin/pacman -Fyy
    /usr/bin/pacman-db-upgrade
    echo -e "S\nS" | /usr/bin/pacman -Scc
    /usr/bin/sync
    echo -e "\n${symbol_progress} ${col_txt_bld_wht}Actualizando DB ${col_txt_bld_pur}locate${col_txt_bld_wht}."
    /usr/bin/updatedb
    echo -e "\n${symbol_completed} Hecho!\n${colors_end}"
    /usr/bin/tput cnorm
else
    echo -e "\n${symbol_error} ${col_txt_bld_wht}Debes ejecutar este script como root.${colors_end}\n"
    /usr/bin/tput cnorm
    exit 1
fi
