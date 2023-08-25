#!/bin/bash

declare -r user=$(whoami)

cp -r ./config/htop ~/.config/htop
cp -r ./config/kitty ~/.config/kitty
cp -r ./config/bspwm ~/.config/bspwm
cp -r ./config/sxhkd ~/.config/sxhkd
cp -r ./config/picom ~/.config/picom
cp -r ./config/polybar ~/.config/polybar
cp -r ./config/starship.toml ~/.config/starship.toml

sudo ln -s -f /home/$user/config/htop/ /root/.config/
sudo ln -s -f /home/$user/config/kitty/ /root/.config/
sudo ln -s -f /home/$user/config/starship.toml /root/.config/starship.toml
