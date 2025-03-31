#!/bin/bash -e

WALLPAPER_DIR="$HOME/.config/utilidadesYSistema/home/wallpapers"

feh --bg-scale "$(find $WALLPAPER_DIR -type f \( -iname "*.png" \) | shuf -n 1)"

