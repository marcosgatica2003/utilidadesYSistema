#!/bin/bash
if grep -q "Raspberry Pi" /proc/device-tree/model; then
    cpuTemp=$(awk '{print $1/1000}' /sys/class/thermal/thermal_zone0/temp)
    tempsFormatted="ARM +$cpuTemp °C"

else
    # Obtener todas las temperaturas usando sensors
    sensorsOutput=$(sensors)

    # Obtener la temperatura de la GPU NVIDIA
    gpuTemp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)

    # Procesar las temperaturas relevantes de una sola vez
    tempsFormatted=$(awk -v gpuTemp="$gpuTemp" '
        /temp1|Composite|Tctl|edge/ {
            sensor=$1
            temp=$2
            # Eliminar el carácter ':' si existe
            gsub(/:/, "", sensor)
            print sensor, temp
        }
        END {
            # Añadir la temperatura de la GPU al final
            print "GPU + '$gpuTemp' °C"
        }
    ' <<< "$sensorsOutput")

fi 

# Mostrar las temperaturas en rofi
echo "$tempsFormatted" | rofi -dmenu -font "terminus Bold 12" -p "         TEMPERATURAS" -theme $HOME/.config/utilidadesYSistema/configuracionesRofi/temaTemperaturas.rasi -yoffset -260 -xoffset 650 -no-show-icons -disable-history 

