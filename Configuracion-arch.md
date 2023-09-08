# Configuración ArchLinux

Para **Parrot** siga los pasos de [Configuracion parrot](Configuracion-parrot.md). Para distrubiciones como **Debian** y **Fedora** tenemos [Configuracion extra](Configuracion-extra.md).

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
