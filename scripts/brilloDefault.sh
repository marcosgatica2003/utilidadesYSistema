#!/bin/bash

if [ -f /etc/debian_version ]; then
    xrandr --output eDP --brightness 0.6
elif [ -f /etc/arch-release ]; then
    xrandr --output eDP-1 --brightness 0.6
fi
