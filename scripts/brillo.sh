#!/bin/bash

BRILLO=$1

if [ -f /etc/debian_version ]; then
    xrandr --output eDP --brightness "$BRILLO"
elif [ -f /etc/arch-release ]; then
    xrandr --output eDP-1 --brightness "$BRILLO"
fi

