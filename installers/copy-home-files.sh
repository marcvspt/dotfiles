#!/bin/bash

declare -r user=$(whoami)

cp ./home/bashrc ~/.bashrc
cp ./home/zshrc ~/.zshrc
cp ./home/p10k.zsh ~/.p10k.zsh
cp ./home/nanorc ~/.nanorc
cp ./home/vimrc ~/.vimrc
cp ./home/Xdefaults ~/.Xdefaults

sudo ln -s -f /home/$user/.bashrc /root/.bashrc
sudo ln -s -f /home/$user/.zshrc /root/.zshrc
sudo ln -s -f /home/$user/.p10k.zsh /root/.p10k.zsh
sudo ln -s -f /home/$user/.nanorc /root/.nanorc
sudo ln -s -f /home/$user/.vimrc /root/.vimrc
sudo ln -s -f /home/$user/.Xdefaults /root/.Xdefaults

mkdir ~/Imágenes/
cp ./avatar.jpg ~/Imágenes/avatar.jpg
