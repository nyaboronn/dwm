#!/bin/bash

# Generar directorio si no existe
mkdir -p ~/.config/dunst

# Extraer colores de Xresources
NORMBG=$(xrdb -query | grep "^dwm.normbgcolor" | awk '{print $2}')
NORMFG=$(xrdb -query | grep "^dwm.normfgcolor" | awk '{print $2}')
SELBORDER=$(xrdb -query | grep "^dwm.selbordercolor" | awk '{print $2}')
SELFG=$(xrdb -query | grep "^dwm.selfgcolor" | awk '{print $2}')

# Asignar colores por defecto
SELBORDER=${SELBORDER:-"#222222"}
SELFG=${SELFG:-"#ffffff"}

# dunstrc
cat > ~/.config/dunst/dunstrc << EOF
[global]
    font = Monospace 10
    format = "%s\n%b"
    geometry = "300x5-30+20"

[urgency_low]
    background = "$SELBORDER"
    foreground = "$SELFG"

[urgency_normal]
    background = "$SELBORDER"
    foreground = "$SELFG"

[urgency_critical]
    background = "$SELBORDER"
    foreground = "$SELFG"
EOF

# Para proceso existente y lanzar en background
pkill -x dunst 2>/dev/null
sleep 0.8
nohup dunst >/dev/null 2>&1 &
