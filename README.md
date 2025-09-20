# dwm - dynamic window manager - nyaboron's build

## Parches

* [dwm-attachaside-6.4](https://dwm.suckless.org/patches/attachaside/dwm-attachaside-6.4.diff)

## Shortcuts

* **MODKEY**: Windows
* **Terminal**: Win + Enter
* **Kill window**: Win + W

## Requisitos

**Fuente:** JetBrainsMono Nerd Font

```
pacman -S ttf-jetbrains-mono
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