# Configuración general

Herramientas y configuraciones de terminal para un entorno personalizado de **Kali Linux**.

- [Configuración general](#configuración-general)
  - [Instalaciones](#instalaciones)
    - [Software del sistema](#software-del-sistema)
    - [Software que no estan en APT](#software-que-no-estan-en-apt)
    - [Instalación por repositorios](#instalación-por-repositorios)
    - [Fuentes](#fuentes)
  - [Configuraciones](#configuraciones)
  - [Opcional](#opcional)
    - [TLD o dominio raíz personalizado en navegador web](#tld-o-dominio-raíz-personalizado-en-navegador-web)
    - [Cambiar prompt](#cambiar-prompt)
    - [Nevagador por default](#nevagador-por-default)
  - [Errores y soluciones](#errores-y-soluciones)
  - [Creditos](#creditos)

Para un entorno más básico consultar la información [Extras](Extras.md).

## Instalaciones

### Software del sistema

No instalados en Kali por defecto

```bash
sudo update -y
sudo apt install -y bat cmake dnsutils docker-compose docker.io gettext gettext-doc gettext-el gobuster htop html2text httpie jq lsd moreutils neovim ncat p7zip p7zip-full ranger rlwrap suckless-tools tor torbrowser-launcher xclip xterm
```

Entorno de trabajo

```bash
sudo update -y
sudo apt install -y alsa-utils command-not-found flameshot imagemagick kitty fzf starship zsh zsh-autosuggestions zsh-syntax-highlighting
```

Ya instaladas pero utiles

```bash
sudo update -y
sudo apt install -y curl ffuf gcc gettext-base git gzip iptables macchanger make nano net-tools netdiscover netmask nmap openssl openvpn plocate proxychains python-is-python3 python2 python3 python3-pip tcpdump tree ufw unzip vim wget whatweb zip
```

Herramientas de pentest muy grandes

```bash
sudo update -y
sudo apt install -y burpsuite metasploit-framework wireshark zaproxy
```

Extras

```bash
sudo apt install -y libreoffice libreoffice-l10n-es libreoffice-help-es
```

### Software que no estan en APT

Instalación manual

- [python2-pip](Extras.md#descargar-pip2)

### Instalación por repositorios

En el caso de `librewolf` en la documentación oficial se explica como instalarlo en Debian: [Installation instructions for Debian based - Main Debian Repository](https://librewolf.net/installation/debian/#main-debian-repository):

Para `brave` podemos encontrar en la documentación oficial como se instala [Release Channel Installation - Debian, Ubuntu, Mint](https://brave.com/linux/#debian-ubuntu-mint)

En el caso de `visual studio code`, podemos usar el **.deb** directamente para instalarlo y automaticamente se instalará el repositorio para futuras actualizaciones o incluimos desde 0 los repositorios de acuerdo a la documentación: [VSCode Debian and Ubuntu based distributions](https://code.visualstudio.com/docs/setup/linux#_debian-and-ubuntu-based-distributions)

### Fuentes

Se necesitan las siguientes fuentes de [nerd fonts](https://github.com/ryanoasis/nerd-fonts/releases):

- FiraCode
- FantasqueSansMono
- Iosevka

Se necesita también la siguiente fuente para emojis:

- [Noto Emoji](https://fonts.google.com/noto/specimen/Noto+Emoji)

Se deben incluir en la ruta `/usr/local/share/fonts` y ejecutar `sudo fc-cache -v`

## Configuraciones

Copiar archivos de configuraciones:

```bash
user=$(whoami)
sudo chown $user:$user /opt
chmod 755 /home/$user

cp ./home/bashrc ~/.bashrc
cp ./home/zshrc ~/.zshrc
cp ./home/p10k.zsh ~/.p10k.zsh
cp ./home/nanorc ~/.nanorc
cp ./home/vimrc ~/.vimrc
cp ./home/Xdefaults ~/.Xdefaults
rm -rf /home/$user/.config/htop && cp -r ./config/htop /home/$user/.config/
rm -rf /home/$user/.config/kitty && cp -r ./config/kitty /home/$user/.config/
cp -r ./config/starship.toml /home/$user/.config/starship.toml
cp -r ./opt/* /opt/
```

Configuraciones apartir de repositorios:

- [**Powerlevel10k**](https://github.com/romkatv/powerlevel10k#manual)
- [**NvChad**](https://nvchad.com/docs/quickstart/install)

Plugins de `zsh`:

- [**ZSH sudo plugin**](https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh) debe ir en `/opt/zsh-sudo/`
- [**ZSH git plugin**](https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/git/git.plugin.zsh) debe ir en `/opt/zsh-git/`

Haremos links simbólicos a estos archivos para root, de esta forma no necesitaremos instalar de nuevo estas herramientas, temas y configuraciones para root:

```bash
user=$(whoami)
sudo mkdir -p /root/.local/share/ 2>/dev/null
sudo mkdir -p /root/.local/state/ 2>/dev/null
sudo mkdir -p /root/.conf/

sudo ln -s -f /home/$user/.bashrc /root/.bashrc
sudo ln -s -f /home/$user/.zshrc /root/.zshrc
sudo ln -s -f /home/$user/.p10k.zsh /root/.p10k.zsh
sudo ln -s -f /home/$user/.nanorc /root/.nanorc
sudo ln -s -f /home/$user/.vimrc /root/.vimrc
sudo ln -s -f /home/$user/.Xdefaults /root/.Xdefaults
sudo ln -s -f /home/$user/.config/kitty/ /root/.config/
sudo ln -s -f /home/$user/.config/htop/ /root/.config/
sudo ln -s -f /home/$user/.config/starship.toml /root/.config/starship.toml
sudo ln -s -f /home/$user/.config/nvim /root/.config/
sudo ln -s -f /home/$user/.local/share/nvim /root/.local/share/
sudo ln -s -f /home/$user/.local/state/nvim /root/.local/state/
sudo ln -s -f /home/$user/powerlevel10k /root/
```

Algunos Wallpapers bonitos los tengo en un repositorio propio: [Wallpapers marcvspt (No son propios)](https://github.com/marcvspt/Wallpapers.git)

## Opcional

### TLD o dominio raíz personalizado en navegador web

**Nota:** *SOLO FUNCIONA EN NAVEGADORES BASADOS EN FIREFOX: firefox, waterfox, librewolf, etc.*

Es posible configurar **TLDs** personalizados en nuestro navegador para que se resuelvan normalmente sin tomarlo como una *query* de busqueda en la web. Debemos añadir una regla booleana como *True* en `about:config` de la *URL*, por ejemplo:

```url
browser.fixup.domainsuffixwhitelist.htb
```

`.htb` es el dominio raíz como `.com`, `.io`, `.org`, etc., ahora podemos poner `searcher.htb`, `lolipop.htb`, etc., y nos dirigirá al dominio personalizado.

![TLD o dominio raíz personalizado en navegador web](tld-htb-librewolf.png)

### Cambiar prompt

Si quieres usar `starship` en vez de `powerlevel10k` comenta estas lineas en [**ZSHRC**](home/.zshrc):

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

### Nevagador por default

Para establecer el navegador web por default hacemos lo siguiente:

```bash
sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /usr/bin/librewolf 100
sudo update-alternatives --config x-www-browser
##### Select librewolf
```

Buscar el binario en las rutas `bin` como:

- `/bin`
- `/usr/bin`
- `/usr/local/bin`
- `/sbin`
- `/usr/sbin`
- `/usr/local/sbin`

## Errores y soluciones

[Errores.md](Errores.md)

## Creditos

Este entorno está inspirado en el de **s4vitar**, mezclando algunas configuraciones y herramientas de sus 2 últimos vídeos de configuración de entornos para linux en YT:

- [Entorno Parrot de s4vitar](https://www.youtube.com/watch?v=mHLwfI1nHHY).
- [Entorno Arch de s4vitar](https://www.youtube.com/watch?v=fshLf6u8B-w).
