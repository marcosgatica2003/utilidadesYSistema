#!/bin/bash


cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

echo -e " CPU: Ryzen 5 5600H\n Uso: $cpu_usage%" | rofi -dmenu -i -p "CPU" -font "Hack Nerd Font Bold 11" -theme $HOME/.config/utilidadesYSistema/configuracionesRofi/temaCPU.rasi -disable-history -yoffset 400 -xoffset -160

