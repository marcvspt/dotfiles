# Configuración extra

Para **Kali** siga los pasos de [Configuracion Kali](Configuracion-kali.md). Para **Arch** siga los pasos de [Configuracion arch](Configuracion-arch.md).

- [Configuración extra](#configuración-extra)
  - [DEBIAN](#debian)
  - [FEDORA](#fedora)
  - [Configuración vbox-guest-utils](#configuración-vbox-guest-utils)
  - [Descargar pip2](#descargar-pip2)

## DEBIAN

```bash
sudo apt update -y
sudo apt dist-upgrade -y
sudo apt install linux-headers-$(uname -r) gcc make cmake p7zip p7zip-full zip unzip tar git curl wget gzip net-tools dnsutils moreutils vim ranger ufw iptables openssh-server nano htop tree xclip mlocate -y
```

## FEDORA

```bash
sudo dnf update -y
sudo dnf install dkms kernel kernel-devel kernel-headers gcc make bzip2 perl elfutils-libelf-devel cmake zip unzip gzip tar p7zip p7zip-plugins wget curl git net-tools bind-utils moreutils vim ranger ufw iptables openssh-server tree nano htop epel-release xclip mlocate -y
```

## Configuración vbox-guest-utils

```bash
sudo mount /dev/cdrom /mnt
cd /mnt
sudo ./VBoxLinuxAdditions.run
sudo adduser user vboxsf
sudo reboot now
```

## Descargar pip2

```bash
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
sudo python2 get-pip.py
```
