#!/bin/bash

IMAGEN="$HOME/.config/polybar/scripts/yael.jpg"

if wmctrl -l | grep -q "YaelPhoto"; then
    exit 0
fi 

# bspc rule -a feh:YaelPhoto state=floating sticky=on rectangle=300x300+2700+40 

feh --scale-down --geometry 400x300+1500+40 --title "YaelPhoto" "$IMAGEN" &
