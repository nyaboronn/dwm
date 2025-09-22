# dwm - dynamic window manager - nyaboron's build

## Parches

* [dwm-attachaside-6.4](https://dwm.suckless.org/patches/attachaside/dwm-attachaside-6.4.diff)
* [dwm-systray-6.3](https://dwm.suckless.org/patches/systray/dwm-systray-6.3.diff)
* [dwm-gaps-6.0](https://dwm.suckless.org/patches/gaps/dwm-gaps-6.0.diff)
* [dwm-restartsig-20180523-6.2](https://dwm.suckless.org/patches/restartsig/dwm-restartsig-20180523-6.2.diff)

## Shortcuts

* **MODKEY**: Windows
* **Terminal**: Win + Enter
* **Kill window**: Win + W
* **Zoom**: Win + z

## Requisitos

**Fuente:** JetBrainsMono Nerd Font

```
pacman -S ttf-jetbrains-mono
```

**Volumen, brillo y micrófono desde el teclado:** libX11
```
sudo pacman -S libx11
```

## Instalación

Clonar, compilar e instalar.
```
git clone https://github.com/nyaboronn/dwm.git
cd dwm
make clean install
```

Ejecutar el binario desde .xinitrc
```
echo "exec dwm" >> ~/.xinitrc
```