#!/bin/bash

winID=$(xdotool getactivewindow)
winCLASS=$(xprop -id "$winID" WM_CLASS | awk -F '"' '{print $(NF-1)}')

if [ "$winCLASS" = "tabbed" ]; then
    tabc detach "$winID"
else
    tabc create "$winID"
fi
