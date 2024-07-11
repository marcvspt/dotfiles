# Configuraciones para Kali

Para **Arch** siga los pasos de [Configuracion arch](Configuracion-arch.md). Para distrubiciones como **Debian** y **Fedora** tenemos [Configuracion extra](Configuracion-extra.md).

- [Configuraciones para Kali](#configuraciones-para-kali)
  - [Instalar software del sistema](#instalar-software-del-sistema)
  - [Software que no estan en APT](#software-que-no-estan-en-apt)
    - [Instalación manual](#instalación-manual)
    - [Instalación por repositorios](#instalación-por-repositorios)
  - [Opcional](#opcional)
    - [Nevagador por default](#nevagador-por-default)
  - [Errores y soluciones](#errores-y-soluciones)

## Instalar software del sistema

```bash
./installers/install-tools-kali.sh
```

## Software que no estan en APT

### Instalación manual

- [starship](https://starship.rs/es-ES/guide/#%F0%9F%9A%80-instalacion)
- [python2-pip](Configuracion-extra.md#descargar-pip2)
- [neovim (latest)](https://github.com/neovim/neovim-releases/releases)

Instalar picom (mejor opción que con APT):

```bash
sudo apt update
sudo apt install meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev libpcre3-dev libev4

cd ~/Templates
git clone https://github.com/ibhagwan/picom.git
cd picom/
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
```

### Instalación por repositorios

En el caso de `librewolf` seguir mi tutorial de mi [página web](https://marcvspt.github.io/posts/instalar-librewolf-parrot-derivados-debian/):

```bash
sudo apt update && sudo apt install -y wget gnupg lsb-release apt-transport-https ca-certificates

wget -O- https://deb.librewolf.net/keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/librewolf.gpg

sudo tee /etc/apt/sources.list.d/librewolf.sources << EOF > /dev/null
Types: deb
URIs: https://deb.librewolf.net
Suites: bullseye
Components: main
Architectures: amd64
Signed-By: /usr/share/keyrings/librewolf.gpg
EOF

sudo apt update
sudo apt install librewolf -y
```

En el caso de `visual studio code`, podemos usar el **.deb** directamente para instalarlo y automaticamente se instalará el repositorio para futuras actualizaciones:

```bash
sudo apt install wget gpg

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt update
sudo apt install code -y
```

Para instalar `onedriver` use el apartado "**For Debian run the following:**" de los repositorios de **OpenSuse** de [jstaf](https://software.opensuse.org/download.html?project=home%3Ajstaf&package=onedriver):

```bash
echo 'deb http://download.opensuse.org/repositories/home:/jstaf/Debian_11/ /' | sudo tee /etc/apt/sources.list.d/home:jstaf.list
curl -fsSL https://download.opensuse.org/repositories/home:jstaf/Debian_11/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_jstaf.gpg > /dev/null

sudo apt update
sudo apt install onedriver -y
```

Con `microsoft edge` podemos hacer lo siguiente:

```bash
sudo apt update

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge.list'
sudo rm microsoft.gpg

sudo apt update
sudo apt install microsoft-edge-stable
```

Instalar `spotify`:

```bash
sudo apt update
sudo apt install dirmngr

curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt update
sudo apt install spotify-client
```

## Opcional

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
