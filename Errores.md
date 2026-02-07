# Errores y soluciones

Para las configuraciones generales consulte el [README](README.md).

- [Errores y soluciones](#errores-y-soluciones)

  - [ZSHRC](#zshrc)
    - [Bat no funciona](#bat-no-funciona)
  - [Problemas con la hora y fecha](#problemas-con-la-hora-y-fecha)
  - [Virtual Box modo oscuro](#virtual-box-modo-oscuro)

## ZSHRC

### Bat no funciona

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
