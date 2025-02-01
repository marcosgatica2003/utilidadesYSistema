#!/bin/bash

# Obtener todas las temperaturas usando sensors
sensors_output=$(sensors)

# Obtener la temperatura de la GPU NVIDIA
gpu_temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)

# Procesar las temperaturas relevantes de una sola vez
temps_formatted=$(awk -v gpu_temp="$gpu_temp" '
    /temp1|Composite|Tctl|edge/ {
        sensor=$1
        temp=$2
        # Eliminar el carácter ':' si existe
        gsub(/:/, "", sensor)
        print sensor, temp
    }
    END {
        # Añadir la temperatura de la GPU al final
        print "GPU +"gpu_temp"°C"
    }
' <<< "$sensors_output")

# Mostrar las temperaturas en rofi
echo "$temps_formatted" | rofi -dmenu -font "Hack Nerd Font Bold 11" -p "         TEMPERATURAS" -theme $HOME/.config/utilidadesYSistema/configuracionesRofi/temaTemperaturas.rasi -yoffset 350 -xoffset 260 -no-show-icons -disable-history 

