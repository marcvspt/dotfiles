# Configuración general

Herramientas y configuraciones de terminal para un entorno personalizado de **Kali Linux** y/o **Debian**.

- [Configuración general](#configuración-general)
  - [Instalaciones](#instalaciones)
    - [Software del sistema](#software-del-sistema)
    - [Software sin repositorios en APT](#software-sin-repositorios-en-apt)
    - [Fuentes](#fuentes)
    - [Extensiones de nevagador](#extensiones-de-navegador)
  - [Configuraciones](#configuraciones)
  - [Opcional](#opcional)
    - [TLD o dominio raíz personalizado en navegador web](#tld-o-dominio-raíz-personalizado-en-navegador-web)
    - [Cambiar prompt](#cambiar-prompt)
    - [Herramientas por default](#herramientas-por-default)
    - [Grupos](#grupos)
  - [Errores y soluciones](#errores-y-soluciones)

## Instalaciones

### Software del sistema

Algunas ya están instaladas cuando se descarga e importada una máquina preconfigurada, sin embargo, instalando desde 0 con las `.iso` no siempre, dependerá de que software se seleccione en el instalador. Recuerda ejecutar antes:


```bash
sudo apt update -y
sudo apt full-upgrade -y
```

#### Kali


```bash
sudo apt install -y alsa-utils bat chromium cmake command-not-found curl dnsutils docker-compose docker.io ffuf flameshot fzf gcc gettext gettext-base gettext-doc gettext-el git gobuster gzip html2text htop httpie imagemagick iptables jq kitty lsd macchanger make moreutils nano ncat neovim netdiscover netmask net-tools nmap openssl openvpn p7zip p7zip-full plocate proxychains python2 python3 python3-pip python-is-python3 ranger rlwrap starship suckless-tools tcpdump tor torbrowser-launcher tree ufw unzip vim wget whatweb xclip xterm zip zsh zsh-autosuggestions zsh-syntax-highlighting
```

Herramientas de pentest/red-team/hacking muy grandes que pueden estar ya instaladas, se recomienda instalar por aparte ya que podrían tardar.

```bash
sudo apt install -y burpsuite metasploit-framework wireshark zaproxy
```

> Para WSL  `sudo apt install -y bat cmake command-not-found curl dnsutils ffuf fzf gcc gettext gettext-base gettext-doc gettext-el git gobuster gzip html2text htop httpie iptables jq lsd macchanger make metasploit-framework moreutils nano ncat neovim netdiscover netmask net-tools nmap openssl openvpn p7zip p7zip-full plocate proxychains python2 python3 python3-pip python-is-python3 ranger rlwrap starship suckless-tools tcpdump tor tree ufw unzip vim wget whatweb xclip xterm zip zsh zsh-autosuggestions zsh-syntax-highlighting`

#### Debian


```bash
sudo apt install -y alsa-utils bat cmake command-not-found curl dnsutils docker-compose docker.io flameshot fzf gcc gettext gettext-base gettext-doc gettext-el git gzip html2text htop httpie imagemagick iptables jq kitty lsd make moreutils nano ncat neovim netmask net-tools openssl openvpn p7zip p7zip-full plocate python3 python3-pip python-is-python3 ranger starship suckless-tools tree ufw unzip vim wget xclip xterm zip zsh zsh-autosuggestions zsh-syntax-highlighting
```

> Para WSL `sudo apt install -y bat cmake command-not-found curl dnsutils fzf gcc gettext gettext-base gettext-doc gettext-el git gzip html2text htop httpie iptables jq lsd make moreutils nano ncat neovim netmask net-tools openssl openvpn p7zip p7zip-full plocate python3 python3-pip python-is-python3 ranger starship suckless-tools tree ufw unzip vim wget xclip xterm zip zsh zsh-autosuggestions zsh-syntax-highlighting`
`

#### Extras


```bash
sudo update -y
sudo apt install -y libreoffice libreoffice-l10n-es libreoffice-help-es
```


### Software sin repositorios en APT

Para `pip2` necesitaremos descargar el instalador de forma externa:


```bash
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
sudo python2 get-pip.py
```

Algunas herramientas utiles desarrolladas por mí, aquí el [repositorio](https://github.com/marcvspt/bash-tools). En este entorno, se considera que se pondrán en la ruta `/opt/bin` a diferencia de lo mostrado en el repo:


```bash
user=$(whoami)
sudo chown $user:$user /opt

mkdir -p /opt/bin
git clone https://github.com/marcvspt/bash-tools.git
cd bash-tools/
cp *.sh /opt/bin
```

Para el prompt de zsh usaremos [Powerlevel10k](https://github.com/romkatv/powerlevel10k#manual) y para el entorno de Neovim usaremos [NvChad](https://nvchad.com/docs/quickstart/install).

En el caso de `librewolf` en la documentación oficial se explica como instalarlo en Debian: [Installation instructions for Debian based - Main Debian Repository](https://librewolf.net/installation/debian/#main-debian-repository).

Para `brave` podemos encontrar en la documentación oficial como se instala [Release Channel Installation - Debian, Ubuntu, Mint](https://brave.com/linux/#debian-ubuntu-mint).

En el caso de **Visual Studio Code**, podemos usar el `.deb` directamente para instalarlo y automaticamente se instalará el repositorio para futuras actualizaciones o incluimos desde 0 los repositorios de acuerdo a la documentación: [VSCode Debian and Ubuntu based distributions](https://code.visualstudio.com/docs/setup/linux#_debian-and-ubuntu-based-distributions).

En el caso de `fnm` se tiene que seguir las instrucciones de su [repositorio](https://github.com/Schniz/fnm#using-a-script-macoslinux).

### Fuentes

Se necesitan fuentes de [nerd fonts](https://github.com/ryanoasis/nerd-fonts/releases) para que los iconos funcionen bien, en especial uso `FiraCode` por las *font ligatures*.

Se necesita también la fuente [Noto Emoji](https://fonts.google.com/noto/specimen/Noto+Emoji) para emojis.

> Se deben incluir en la ruta `/usr/local/share/fonts` y ejecutar `sudo fc-cache -v`.

### Extensiones de navegador

- [Wappalyzer - Technology profiler](https://www.wappalyzer.com/)
- [BuiltWith Technology Profiler](https://builtwith.com/toolbar)
- [User-Agent Switcher and Manager](https://github.com/ray-lothian/UserAgent-Switcher/)
- [FoxyProxy Browser Extension](https://github.com/foxyproxy/browser-extension)
- [IP Address and Domain Information](https://dnslytics.com/browser-extensions-addons-accelerators/)
- [RevEye Reverse Image Search](https://squobble.com/)
- [HackTools](https://github.com/LasCC/HackTools)
- [Privacy Badger](https://privacybadger.org/)
- [uBlock Origin/Lite](https://ublockorigin.com/)
- [JSON Viewer](https://github.com/pd4d10/json-viewer)
- [File Icon for GitHub, GitLab and Bitbucket](https://github.com/homerchen19/github-file-icons)
- [Dark Reader](https://github.com/darkreader/darkreader)

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
rm -rf /home/$user/.config/htop 2>/dev/null && cp -r ./config/htop /home/$user/.config/
rm -rf /home/$user/.config/kitty 2>/dev/null && cp -r ./config/kitty /home/$user/.config/
rm /home/$user/.config/starship.toml 2>/dev/null && cp ./config/starship.toml /home/$user/.config/starship.toml
cp -r ./opt/* /opt/
```

Plugins de `zsh`:

- [**ZSH sudo plugin**](https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh) debe ir en `/opt/zsh-sudo/`
- [**ZSH git plugin**](https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/git/git.plugin.zsh) debe ir en `/opt/zsh-git/`

Haremos links simbólicos a estos archivos para root, de esta forma no necesitaremos instalar de nuevo estas herramientas, temas y configuraciones para root (***NO SE RECOMIENDA EN SERVIDORES PRODUCTIVOS***):


```bash
user=$(whoami)
sudo mkdir -p /root/.local/share/ 2>/dev/null
sudo mkdir -p /root/.local/state/ 2>/dev/null
sudo mkdir -p /root/.config/ 2>/dev/null

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

## Opcional

Algunos Wallpapers bonitos puden descargarlos en mi reporistorio [Wallpapers marcvspt](https://github.com/marcvspt/Wallpapers.git) (No son propios, solo los recopilé).

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

### Herramientas por default

Para establecer el navegador web por default hacemos lo siguiente:

```bash
sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /usr/bin/librewolf 100
sudo update-alternatives --config x-www-browser
##### Select librewolf
```

Para configurar el comando `vi` para que abra y ejecute `nvim` hacemos lo siguiente:

```bash
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 100
sudo update-alternatives --config vi
##### Select nvim
```

Se debe buscar los binarios en las rutas `bin` del sistema como:
- `/bin`
- `/usr/bin`
- `/usr/local/bin`
- `/sbin`
- `/usr/sbin`
- `/usr/local/sbin`

### Grupos

Algunas herramientas comunes necesitan permisos de **root**, sin embargo, algunos grupos ya tienen esos permisos:

```bash
user=$(whoami)
sudo usermod -aG docker,tcpdump,wireshark,www-data $user
```

## Errores y soluciones

[Errores.md](Errores.md)