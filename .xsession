#!/bin/sh
#
# Arranque de las X
# Tanto para el gestor de sessiones como para startx
#
# Para startx se usa el .xinitrc.

# Carga recursos
[[ -f $HOME/.Xresources ]] && xrdb -I$HOME -merge $HOME/.Xresources
#$HOME/bin/loadresources

# Velocidad y puntero del ratón
xset m 3

# Sonido del pitido
xset b 15 200 150

# Protector de pantalla a 60 minutos
xset s off
xset dpms 3600 3600 3600

# Mis fuentes
xset fp+ $HOME/.local/share/fonts/misc
xset fp+ $HOME/.local/share/fonts/ohsnap
xset fp+ $HOME/.local/share/fonts/terminesspowerline
xset fp+ $HOME/.local/share/fonts/tewi
fc-cache -v
# TTF se cargan automaticamente en .fonts

# Mis teclas
#xmodmap $HOME/.Xmodmap

# Gestor de ficheros
#exec rox -p default &

# Correo
#exec fetchmail &
#exec xmailbox -geometry 16x16+915+9&

# Fondo
[[ -f $HOME/.fehbg ]] && sh $HOME/.fehbg

# Programas para el i3
#exec conky -c ~/.i3/conkyrc &
#exec nm-applet &

# Notificador
# Paquete notification-daemon
# Probar con notify-send (paquete libnotify-bim)
#exec /usr/lib/notification-daemon/notification-daemon &
exec dunst -config ~./config/dunst/dunstrc &

# Remapear los botones del ratón extendido
# Paquete xinput
# "xinput list" -> muestra los dispositivos
# Cambia el Wheel Left (6) por el Middle click (2)
#xinput set-button-map 10 1 2 3 4 5 2 7 8 9

# Bar -> Parche para que se muestre polybar en el arranque de i3
# Sin el "sleep" solo se muestra con la primera ventana ¿?
(sleep 3; exec ~./config/polybar/launch.sh) &

# Gestor de ventanas
exec i3
