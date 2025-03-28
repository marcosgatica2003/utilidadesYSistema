#!/bin/bash

ram_total=$(free -h --giga | awk '/^Mem/ {print $2}')
ram_used=$(free -h --giga | awk '/^Mem/ {print $3}')

echo -e " RAM en uso: $ram_used GiB\n RAM total: $ram_total GiB" | rofi -dmenu -p "RAM" -font "Hack Nerd Font Bold 11" -theme $HOME/.config/utilidadesYSistema/configuracionesRofi/temaRAM.rasi -disable-history -yoffset 400 -xoffset 50

