#!/bin/bash

WALLPAPER_DIR="$HOME/.config/utilidadesYSistema/configuracionesEsenciales/home/wallpapers"

feh --bg-scale "$(find $WALLPAPER_DIR -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)"

