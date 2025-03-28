#!/bin/bash -e

tituloCorto=$(echo $(xdotool getwindowfocus getwindowname 2>/dev/null) | cut -c -30)

if [[ -n "$tituloCorto" ]]; then
    echo "$tituloCorto"
else
    echo ""
fi
