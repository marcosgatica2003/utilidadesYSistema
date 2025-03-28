#!/bin/bash

almacenamiento=$(df -h --output=source,size,used,avail,pcent | grep -E 'nvme|zram')

echo "$almacenamiento" | rofi -dmenu -p "        INFORMACIÓN DE LAS UNIDADES" -font "Hack Nerd Font Bold 11" -theme $HOME/.config/utilidadesYSistema/configuracionesRofi/temaSTG.rasi -disable-history -yoffset 400
