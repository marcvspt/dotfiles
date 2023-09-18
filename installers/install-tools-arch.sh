#!/usr/bin/bash

# Install arch packages
/usr/bin/sudo /usr/bin/pacman -Syu
/usr/bin/sudo /usr/bin/pacman -S alsa-utils bat bspwm docker docker-compose evil-winrm feh flameshot gspell httpie imagemagick jq kitty lightdm-gtk-greeter-settings linux-headers lsd moreutils neovim paru pkgfile polybar python2-pip ranger rlwrap rofi scrot starship sxhkd theharvester torbrowser-launcher tree volumeicon wget wmname xclip zsh-autosuggestions zsh-syntax-highlighting

# Install fonts
/usr/bin/sudo /usr/bin/pacman -S ttf-firacode-nerd ttf-fantasque-nerd ttf-iosevka-nerd noto-fonts-emoji

# Install aur packages
/usr/bin/paru -Syu
/usr/bin/paru -S betterlockscreen librewolf-bin visual-studio-code-bin
