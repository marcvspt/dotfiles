# Configuración ArchLinux

Para **Kali** siga los pasos de [Configuracion Kali](Configuracion-kali.md). Para distrubiciones como **Debian** y **Fedora** tenemos [Configuracion extra](Configuracion-extra.md).

- [Configuración ArchLinux](#configuración-archlinux)
  - [Instalar software del sistema](#instalar-software-del-sistema)
  - [Opcional](#opcional)
    - [Nevagador por default](#nevagador-por-default)
    - [Software extra](#software-extra)
  - [Errores y Soluciones](#errores-y-soluciones)

## Instalar software del sistema

Puedes editar los scripts para eliminar las herramientas que no necesites:

```bash
./installers/install-tools-arch.sh
```

Instalar picom (mejor opción que con PACMAN o PARU):

```bash
sudo pacman -Syu
sudo pacman -S meson ninja libxext libxcb pixman dbus libdbusmenu-glib libconfig libglvnd glibmm glib2 pcre pcre2 libevdev libev uthash libev libxdamage libxfixes xcb-util-renderutil libxrandr libxcomposite libimagequant libxpresent libxinerama mesa libglvnd libva

cd ~/Templates
git clone https://github.com/ibhagwan/picom.git
cd picom/
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
```

## Opcional

### Nevagador por default

Para establecer el navegador web por default hacemos lo siguiente:

```bash
browser='librewolf.desktop'

sudo xdg-settings set default-web-browser $browser
sudo xdg-settings set default-url-scheme-handler https $browser
sudo xdg-settings set default-url-scheme-handler http $browser
sudo xdg-settings set default-url-scheme-handler mailto $browser
```

Buscar el `.desktop` en la ruta `/usr/share/applications/`.

### Software extra

```bash
paru -Syu
sudo pacman -S brightnessctl cbatticon libreoffice-still libreoffice-still-es xfce4-genmon-plugin
paru -S onedriver microsoft-edge-stable-bin
```

## Errores y Soluciones

[Errores.md](Errores.md)
