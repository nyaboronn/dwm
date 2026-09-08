# Añadir al path la carpeta con los scripts
export PATH="$HOME/scripts:$PATH"

# Aplicar el último esquema generado con pywal
wal -R

# Restaurar el fondo que guardó feh
[ -f ~/.fehbg ] && ~/.fehbg

# Para las transparencias
picom &

# Lanzar dwmblocks
dwmblocks &

# Hz del monitor
xrandr --output DP-0 --mode 1920x1080 --rate 165 &

# Para poder subir ficheros desde el navegador
export XDG_CURRENT_DESKTOP=GTK
export GTK_USE_PORTAL=0

# Servidor de notificaciones
~/.config/dunst/generate_config.sh &

# lanzar dwm
exec dwm
