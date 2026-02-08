# Errores y soluciones

Para las configuraciones generales consulte el [README](README.md).

- [Errores y soluciones](#errores-y-soluciones)
  - [onfiguración para un máquina virtual](#configuración-para-un-máquina-virtual)
  - [Comando `bat` no funciona](#comando-bat-no-funciona)
  - [Problemas con la hora y fecha](#problemas-con-la-hora-y-fecha)
  - [Virtual Box modo oscuro](#virtual-box-modo-oscuro)

## No funciona correctamente el $PATH

Cambia el valor de la variable `main_user` en el archivo `.bashrc` y/o `.zshrc` por el usuario en que usaras en el sistema.

## Configuración para un máquina virtual

Si no funciona el compartir clip-board, las carpetas compartidas o el reajuste de ventana instalar para Hipervisor *VirtualBox* usando las `vbox-guest-utils`:


```bash
sudo mount /dev/cdrom /mnt
cd /mnt
sudo ./VBoxLinuxAdditions.run
sudo adduser user vboxsf
sudo reboot now
```

Para Hipervisor *VMWare*:


```bash
sudo apt update -y
sudo apt install -y open-vm-tools open-vm-tools-desktop
```


## Comando `bat` no funciona

En versiones antiguas de `bat`, el comando es `batcat`, por lo que hay que sustituirlo por en el [zshrc](home/zshrc) si es requerido.


## Problemas con la hora y fecha

Podemos consultar esta [guia](https://www.cyberciti.biz/faq/howto-set-date-time-from-linux-command-prompt/) para resolverlo, pero es posible solucionar con esta linea:

```bash
sudo timedatectl set-ntp true
```

## Virtual Box modo oscuro

```bash
sudo apt install -y adwaita-qt
cp /usr/share/applications/virtualbox.desktop ~/.local/share/applications/virtualbox-dark.desktop
```

Añadir esta linea en el `virtualbox-dark.desktop`:

```desktop
###
Exec=env QT_STYLE_OVERRIDE=adwaita-dark VirtualBox %U
###
```
