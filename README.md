# dwm - dynamic window manager - nyaboron's build

## Parches

* [dwm-attachaside-6.4](https://dwm.suckless.org/patches/attachaside/dwm-attachaside-6.4.diff) : fijar a la izquierda el cliente principal
* [dwm-systray-6.3](https://dwm.suckless.org/patches/systray/dwm-systray-6.3.diff) : soporte para los system tray
* [dwm-gaps-6.0](https://dwm.suckless.org/patches/gaps/dwm-gaps-6.0.diff) - espacio entre clientes
* [dwm-restartsig-20180523-6.2](https://dwm.suckless.org/patches/restartsig/dwm-restartsig-20180523-6.2.diff) - permite reiniciar dwm sin cerrar sesión
* [dwm-xrdb-6.4](https://dwm.suckless.org/patches/xrdb/dwm-xrdb-6.4.diff) - soporte para leer los colores de xrdb

## Shortcuts

* **MODKEY**: Windows
* **Terminal**: Win + Enter
* **Kill window**: Win + W
* **Zoom**: Win + z (hacer el cliente principal)

## Requisitos

### **Fuente:** JetBrainsMono Nerd Font

```
pacman -S ttf-jetbrains-mono
```

### **Control del volumen, brillo y micrófono desde el teclado:** libX11
```
sudo pacman -S libx11
```

### **pywal 16:** para el esquema de colores.

[**Wiki oficial de Pywal16**](https://github.com/eylles/pywal16/wiki)

Con **pywal** se puede generar una paleta de colores a partir de cualquier imagen:

```bash
wal -i ~/ruta/imagen.png
```

Tras ejecutar el comando, pywal guarda el esquema generado en `~/.cache/wal/` y ejecuta `xrdb` para mergear las variables de colores. Estas variables pueden ser leídas por **dwm**, **st**, **rofi**, etc.

Para restaurar el último esquema generado se ejecuta:
```bash
wal -R
```

Yo lo añado en mi `~/.xinitrc` para que al iniciar sesión se restaure automáticamente.

Pywal funciona con **plantillas**, que son ficheros con “huecos” (`{color0}`, `{background}`, …) que se sustituyen por los valores de la paleta generada. Las plantillas se guardan en:

```
~/.config/wal/templates/
```

El patch **xrdb** de dwm está programado para buscar variables que empiecen por `dwm.`. En la función `loadxrdb()` se observa:
```c
XRDB_LOAD_COLOR("dwm.normbordercolor", normbordercolor);
XRDB_LOAD_COLOR("dwm.normbgcolor",     normbgcolor);
XRDB_LOAD_COLOR("dwm.normfgcolor",     normfgcolor);
XRDB_LOAD_COLOR("dwm.selbordercolor",  selbordercolor);
XRDB_LOAD_COLOR("dwm.selbgcolor",      selbgcolor);
XRDB_LOAD_COLOR("dwm.selfgcolor",      selfgcolor);
```

Esto significa que, si no tenemos una plantilla que defina estas claves `dwm.*`, dwm no podrá leer los colores de `xrdb`.

Por defecto, pywal usa la plantilla `colors.Xresources`, pensada para terminales y otros programas, pero **no** para dwm. Esto explica que **st** o **rofi** se actualicen directamente tras `wal -i`, pero **dwm** no.

Podemos comprobar qué claves se están cargando con:
```bash
xrdb -query | grep '^dwm\.'
```

Una vez generada la paleta se aplican los colores de la sigueinte forma:

- **Cerrar sesión** y volver a entrar, o
- Usando el atajo `Mod+F5` (definido en el patch `xrdb`).



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