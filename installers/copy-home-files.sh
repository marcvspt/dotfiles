#!/usr/bin/bash

declare -r user=$(/usr/bin/whoami)

/usr/bin/cp ./home/bashrc ~/.bashrc
/usr/bin/cp ./home/zshrc ~/.zshrc
/usr/bin/cp ./home/p10k.zsh ~/.p10k.zsh
/usr/bin/cp ./home/nanorc ~/.nanorc
/usr/bin/cp ./home/vimrc ~/.vimrc
/usr/bin/cp ./home/Xdefaults ~/.Xdefaults

/usr/bin/sudo /usr/bin/ln -s -f /home/$user/.bashrc /root/.bashrc
/usr/bin/sudo /usr/bin/ln -s -f /home/$user/.zshrc /root/.zshrc
/usr/bin/sudo /usr/bin/ln -s -f /home/$user/.p10k.zsh /root/.p10k.zsh
/usr/bin/sudo /usr/bin/ln -s -f /home/$user/.nanorc /root/.nanorc
/usr/bin/sudo /usr/bin/ln -s -f /home/$user/.vimrc /root/.vimrc
/usr/bin/sudo /usr/bin/ln -s -f /home/$user/.Xdefaults /root/.Xdefaults

/usr/bin/mkdir /home/$user/Imágenes/ 2>/dev/null
/usr/bin/cp ./avatar.jpg /home/$user/Imágenes/avatar.jpg
