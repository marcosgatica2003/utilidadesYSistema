#!/bin/bash

WALLPAPER_DIR=~/Wallpapers

while true; do
	feh --bg-scale "$(find $WALLPAPER_DIR -type f \( -name "*.jpg" -o -name "*.png" \) | shuf -n 1)"

	sleep 600
done
