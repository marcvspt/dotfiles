# Extras

Para **Kali** siga los pasos principales del [README](README.md).

- [Extras](#extras)
  - [Debian](#debian)
  - [Fedora](#fedora)
  - [Configuración vbox-guest-utils](#configuración-vbox-guest-utils)
  - [Descargar pip2](#descargar-pip2)
  - [bash-tools](#bash-tools)

## Debian

```bash
sudo apt update -y
sudo apt full-upgrade -y
sudo apt install -y cmake curl dnsutils gcc git gzip htop iptables linux-headers-$(uname -r) make moreutils ncat nano net-tools netcat-traditional open-vm-tools open-vm-tools-desktop openssh-server p7zip p7zip-full plocate ranger tar tree ufw unzip vim wget xclip zip
```

## Fedora

```bash
sudo dnf update -y
sudo dnf install -y bind-utils bzip2 cmake curl dkms elfutils-libelf-devel epel-release gcc git gzip htop iptables kernel kernel-devel kernel-headers make moreutils nano net-tools openssh-server p7zip p7zip-plugins perl plocate ranger tar tree ufw unzip vim wget xclip zip
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

## bash-tools

Algunas herramientas utiles desarrolladas por mí, aquí el [repositorio](https://github.com/marcvspt/bash-tools). En este entorno, se considera que se pondrán en la ruta `/opt/bin` a diferencia de lo mostrado en el repo:

```bash
user=$(whoami)
sudo chown $user:$user /opt

mkdir -p /opt/bin
git clone --depth 1 https://github.com/marcvspt/bash-tools.git
cd bash-tools/
cp *.sh /opt/bin

echo 'export PATH=$PATH:/opt/bin/' >> ~/.bashrc # ~/.zshrc
source ~/.bashrc # ~/.zshrc
```