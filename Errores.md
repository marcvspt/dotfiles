# Errores y soluciones

Para las configuraciones generales consulte el [README](README.md).

- [Errores y soluciones](#errores-y-soluciones)
  - [Bspwm](#bspwm)
    - [No funciona doble monitor](#no-funciona-doble-monitor)
  - [ZSHRC](#zshrc)
    - [Bat no funciona](#bat-no-funciona)
    - [Plugins no funcinan en Arch](#plugins-no-funcinan-en-arch)
  - [Polybar](#polybar)
    - [IP de la interaz](#ip-de-la-interaz)
    - [La bateria no se muestra](#la-bateria-no-se-muestra)
    - [Fallo iconos y colores](#fallo-iconos-y-colores)
  - [Aplicaciones no inician rofi -show drun](#aplicaciones-no-inician-rofi--show-drun)
  - [Problemas con la hora y fecha](#problemas-con-la-hora-y-fecha)
  - [Lenguaje de teclado](#lenguaje-de-teclado)
  - [Problemas con claves y repositorios ArchLinux](#problemas-con-claves-y-repositorios-archlinux)
  - [Virtual Box modo oscuro](#virtual-box-modo-oscuro)

## Bspwm

### No funciona doble monitor

Es posible que no funcione el doble monitor como esperamos ya que el nombre de los monitores, el tamaño y otras configuraciones no son los mismos que los míos, por lo que necesitamos modicar los siguientes archivos:

- [bspwmrc](config/bspwm/bspwmrc): el `eDP-1` y el `'HDMI-1'` por el nombre de tu primer y segundo monitor respectivamente.
- [dual-monitor.sh](opt/bin/dual-monitor.sh):  el `eDP-1` y el `'HDMI-1'` por el nombre de tu primer y segundo monitor respectivamente.
- [config.ini](config/polybar/forest/config.ini): la sección `[bar/secondary]` el `'HDMI-1'` por el nombre de tu segundo monitor.
- [launch.sh](config/polybar/forest/launch.sh): el `'HDMI-1'` por el nombre de tu segundo monitor.

Puedes modififcar las demás configuraciones del `xrandr`. Guardamos cambios y ejecutamos las teclas `Super + Shift + R` y `Super + Esc`.

## ZSHRC

### Bat no funciona

En versiones antiguas de `bat`, el comando es `batcat`, por lo que hay que sustituirlo por en el [zshrc](home/zshrc) si es requerido.

### Plugins no funcinan en Arch

En **Arch** las rutas de los plugins de zsh son diferentes a la que tenemos configuradas en el [zshrc](home/zshrc), ya que está diseñado para **Parrot** y **Kali**. Para solucionarlo solo hay que cambiar la variable `path_plugins`:

```bash
declare -r path_plugins='/usr/share/zsh/plugins'
```

El plugin de `sudo` está configurado para resolver a la ruta `/opt/zsh-sudo`, si se usa una ruta diferente para almacenarlo, solo cambie la variable `sudo_plug`:

## Polybar

### IP de la interaz

Si el **LANIP** no aparece se necesita cambiar las interfaces `eth0` (**iface_eth**) de la conexión Ethernet y `wlan0` (**iface_wifi**) de la conexión inalámbrica en [**BSPWM script**](opt/bin/lan-ip.sh). Compruebe estas interfaces con `ifconfig` o `ip a`.

### La bateria no se muestra

Es posible que no se muestre el estado de la carga de bateria, debido a que el 'modelo' es diferente. Debemos ver que tipo de bateria y adaptador tenemos en la ruta `/sys/class/power_supply` y modificar el modulo de bateria en [modules.ini](config/polybar/forest/modules.ini):

```ini
[module/battery]
#####
battery = BAT1
adapter = ACAD
#####
```

### Fallo iconos y colores

Si el tema falla, deberemos hacer lo siguiente:

```bash
cp -r config/polybar/fonts/* ~/.local/share/fonts/
```

Si no se soluciona, es mejor reinstalar el tema [forest del repo original](https://github.com/adi1090x/polybar-themes) en formato `simple`.

## Aplicaciones no inician rofi -show drun

El problema de algunas apps es su `.desktop`, ya que algunos de sus valores `Exec=` o comandos para iniciarlos no funcionan bien, es mejor hacer una copia y modificarlos de la siguiente forma:

- Copiar el `.desktop` de `/usr/share/applications/` a nuestro `~/.local/share/applicactions` con un nombre similar. Ej:

```bash
cp /usr/share/applications/parrot-wireshark.desktop ~/.local/share/applications/modified-wireshark.desktop
```

- Modificar el nombre a uno similar pero haciendo referencia a que es el modificado. Ej:

```desktop
[Desktop Entry]
Name=wireshark modified
#####
```

- Modificar la opción de ejecución con los parametros que nos funcionan al hacerlo desde consola (usar ruta absoluta). Ej:

```desktop
[Desktop Entry]
####
Exec=/usr/bin/wireshark
```

## Problemas con la hora y fecha

Podemos consultar esta [gúia](https://www.cyberciti.biz/faq/howto-set-date-time-from-linux-command-prompt/) para resolverlo, pero es posible solucionar con esta linea:

```bash
sudo timedatectl set-ntp true
```

## Lenguaje de teclado

Cuando no se instala gestores como **Gnome**, **Xfce4**, **Mate**, etc., y solo configurar los archivos `/etc/locale.conf` y `/etc/vconsole.conf` no es suficiente, se necesita una configuración extra:

```bash
sudo cp ./etc/locale.conf /etc/locale.conf
sudo cp ./etc/vconsole.conf /etc/vconsole.conf
sudo cp ./etc/00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
```

## Problemas con claves y repositorios ArchLinux

```bash
sudo pacman-key --populate archlinux blackarch
sudo pacman-key --refresh-keys
sudo pacman -Sy archlinux-keyring

sudo rm -R /var/lib/pacman/sync
sudo pacman -Syuf

sudo rm /var/lib/pacman/sync/*db.sig*
sudo pacman -Syyu
```

## Virtual Box modo oscuro

```bash
paru -S adwaita-qt5-git # ARCHLINUX
sudo apt install -y adwaita-qt # DEBIAN/PARROT
cp /usr/share/applications/virtualbox.desktop ~/.local/share/applications/virtualbox-dark.desktop
```

Añadir esta linea en el `virtualbox-dark.desktop`:

```desktop
###
Exec=env QT_STYLE_OVERRIDE=adwaita-dark VirtualBox %U
###
```
