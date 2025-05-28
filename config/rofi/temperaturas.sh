#!/bin/bash -e

if [ -f "/sys/firmware/devicetree/base/model" ] && grep -qi "raspberry pi" /sys/firmware/devicetree/base/model; then
    cpuTemp=$(awk '{print $1/1000}' /sys/class/thermal/thermal_zone0/temp)
    tempsFormatted=" ARM +$cpuTemp °C"

else
    sensorsOutput=$(sensors)

    gpuTemp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader 2>/dev/null | awk '{print $1 "°C"}')

    tempsFormatted=$(echo -e "$sensorsOutput" | awk -v gpuTemp="$gpuTemp" '
        /temp1/ { icon="  "; print icon "CPU: " $2 }
        /Tctl|edge/ { icon=" "; print icon "Chipset: " $2 }
        /Composite/ { icon="  "; print icon "Disco: " $2 }
    ')
    
    if [ -n "$gpuTemp" ]; then 
        tempsFormatted="$tempsFormatted\n  GPU: $gpuTemp"
    fi
fi 

echo -e "$tempsFormatted" | rofi -dmenu -p "TEMPERATURAS "  \
    -theme $HOME/.config/rofi/temaTemperaturas.rasi
