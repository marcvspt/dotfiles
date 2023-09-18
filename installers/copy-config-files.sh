#!/usr/bin/bash

declare -r user=$(/usr/bin/whoami)

/usr/bin/cp -r ./config/htop /home/$user/.config/htop
/usr/bin/cp -r ./config/kitty /home/$user/.config/kitty
/usr/bin/cp -r ./config/bspwm /home/$user/.config/bspwm
/usr/bin/cp -r ./config/sxhkd /home/$user/.config/sxhkd
/usr/bin/cp -r ./config/picom /home/$user/.config/picom
/usr/bin/cp -r ./config/polybar /home/$user/.config/polybar
/usr/bin/cp -r ./config/starship.toml /home/$user/.config/starship.toml

/usr/bin/sudo /usr/bin/ln -s -f /home/$user/config/htop/ /root/.config/
/usr/bin/sudo /usr/bin/ln -s -f /home/$user/config/kitty/ /root/.config/
/usr/bin/sudo /usr/bin/ln -s -f /home/$user/config/starship.toml /root/.config/starship.toml
