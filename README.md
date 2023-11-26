# Configuración general

## Creditos

Este entorno está inspirado en el de **s4vitar**, mezclando configuraciones de sus 2 últimos vídeos de configuración de entornos para linux en YT:

- [Entorno Parrot de s4vitar](https://www.youtube.com/watch?v=mHLwfI1nHHY).
- [Entorno Arch de s4vitar](https://www.youtube.com/watch?v=fshLf6u8B-w).

Así com los temas de la polybar de [adi1090x](https://github.com/adi1090x/polybar-themes). Y nuevas cosas hechas por mí.

![entorno bspwm-sxhkd + picom + polybar](demo.png)

- [Configuración general](#configuración-general)
  - [Creditos](#creditos)
  - [Instalar software del sistema](#instalar-software-del-sistema)
  - [Fuentes](#fuentes)
  - [Copiar arhcivos de configuración](#copiar-arhcivos-de-configuración)
    - [Crear links simbólicos](#crear-links-simbólicos)
    - [Cambiar shell de usuarios](#cambiar-shell-de-usuarios)
    - [Establecer fondo](#establecer-fondo)
  - [Opcional](#opcional)
    - [Atajos de aplicaciones](#atajos-de-aplicaciones)
    - [TLD o dominio raíz personalizado en navegador web](#tld-o-dominio-raíz-personalizado-en-navegador-web)
    - [Doble monitor](#doble-monitor)
    - [Cambiar prompt](#cambiar-prompt)
    - [Configurar lightdm](#configurar-lightdm)
  - [Errores y soluciones](#errores-y-soluciones)

## Instalar software del sistema

Para **Parrot** y **Kali** siga los pasos de [Configuracion Parrot y Kali](Configuracion-parrot-kali.md). Para **Arch** siga los pasos de [Configuracion arch](Configuracion-arch.md). Para distrubiciones como **Debian** y **Fedora** tenemos [Configuracion extra](Configuracion-extra.md).

## Fuentes

Se necesitan las siguientes fuentes de [nerd fonts](https://github.com/ryanoasis/nerd-fonts/releases):

- FiraCode
- FantasqueSansMono
- Iosevka

Se necesita también la siguiente fuente para emojis:

- [Noto Emoji](https://fonts.google.com/noto/specimen/Noto+Emoji)

**Nota:** En el script de instalación de **Arch** ya se contempla la instalación de las fuentes, en **Parrot** se deben instalar manualmente.

## Copiar arhcivos de configuración

```bash
user=$(whoami)
sudo chown $user:$user /opt
cp -r ./opt/* /opt/

./installers/copy-home-files.sh
./installers/copy-config-files.sh

chmod 755 /home/$user
```

Si existen errores o no funciona la **Polybar** consultar la sección [Polybar](Errores.md#polybar) de los errores.

Recuerda instalar:

- [**powerlevel10k**](https://github.com/romkatv/powerlevel10k#manual).
- [**fzf**](https://github.com/junegunn/fzf#using-git).
- [**NvChad**](https://nvchad.com/docs/quickstart/install).
- [**ZSH sudo plugin**](https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh).

### Crear links simbólicos

Haremos links simbólicos a estos archivos para root, de esta forma no necesitaremos instalar de nuevo estas herramientas, temas y configuraciones para root:

```bash
sudo mkdir /root/.local/share/ 2>/dev/null

user=$(whoami)
sudo ln -s -f /home/$user/.config/nvim /root/.config/
sudo ln -s -f /home/$user/.local/share/nvim /root/.local/share/
sudo ln -s -f /home/$user/powerlevel10k /root/
sudo ln -s -f /home/$user/.fzf /root/
sudo ln -s -f /home/$user/.fzf.zsh /root/
sudo ln -s -f /home/$user/.fzf.bash /root/
```

### Cambiar shell de usuarios

Cambiar la shell default de los usuarios:

```bash
user=$(whoami)
sudo chsh -s /usr/bin/zsh $user
sudo chsh -s /usr/bin/zsh root
```

### Establecer fondo

Configurar el background del escritorio y de la pantalla de bloqueo:

```bash
git clone https://github.com/marcvspt/Wallpapers.git ~/Imágenes/Wallpapers

user=$(whoami)
betterlockscreen -u /home/$user/Imágenes/Wallpapers/24.jpg # Elige el que más te guste
```

## Opcional

### Atajos de aplicaciones

Se pueden modificar los atajos de teclado del entorno en el archivo [sxhkdrc](config/sxhkd/sxhkdrc). Es importante probar la configuración y al recargar el entorno ejecutar `Super + Esc`.

### TLD o dominio raíz personalizado en navegador web

**Nota:** *SOLO FUNCIONA EN NAVEGADORES BASADOS EN FIREFOX MOZILLA: firefox, waterfox, librewolf, etc.*

Es posible configurar **TLDs** personalizados en nuestro navegador para que se resuelvan normalmente sin tomarlo como una *query* de busqueda en la web. Debemos añadir una regla booleana como *True* en `about:config` de la *URL*, por ejemplo:

```url
browser.fixup.domainsuffixwhitelist.htb
```

`.htb` es el dominio raíz como `.com`, `.io`, `.org`, etc., ahora podemos poner `searcher.htb`, `lolipop.htb`, etc., y nos dirigirá al dominio personalizado.

![TLD o dominio raíz personalizado en navegador web](tld-htb-librewolf.png)

### Doble monitor

Este repositorio ya tiene un script y configuraciones para que **BSPWM** funcione con doble monitor extendido a la derecha. Necesitamos descomentar el bloque if del archivo [bspwmrc](config/bspwm/bspwmrc):

```bash
my_laptop_external_monitor=$(xrandr --query | grep 'HDMI-1')
if [[ $my_laptop_external_monitor != *disconnected* ]]; then
  bspc monitor eDP-1 -d I II III IV V
  bspc monitor HDMI-1 -d VI VII VIII IX X
else
  bspc monitor -d I II III IV V VI VII VIII IX X
fi
```

Guardamos cambios y ejecutamos las teclas `Super + Shift + R` y `Super + Esc`. Si existen errores o no funciona consultar la sección de [Bspwm doble monitor](Errores.md#bspwm-doble-monitor) de los errores.

### Cambiar prompt

Si quieres usar `starship` en vez de `powerlevel10k` comenta estas lineas en [**ZSHRC**](.zshrc):

```zsh
#source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
```

Y descomenta esta linea:

```zsh
eval "$(starship init zsh)"
```

Podemos cambiar el prompt para colorearlo al estilo **Arch**, **Fedora** y **Generic**, es decir, colores personalizados. Debemos descomentar y comentar las secciones correspondientes a los prompts que queremos usar en el [bashrc](home/bashrc). Si quieres usar `starship`, solo descomenta esta linea en el mismo archivo `bashrc`:

```bash
eval "$(starship init bash)"
```

### Configurar lightdm

```bash
cp ./etc/lightdm* /etc/lightdm/
```

## Errores y soluciones

[Errores.md](Errores.md)
