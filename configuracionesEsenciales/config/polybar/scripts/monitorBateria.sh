#!/bin/bash

# Archivo del estado de la batería
battery_path="/sys/class/power_supply/BAT1/capacity"
battery_status_path="/sys/class/power_supply/BAT1/status"

# Lee el porcentaje de la batería
battery_level=$(cat $battery_path)

# Lee el estado de la batería
battery_status=$(cat $battery_status_path)

# Verifica si la batería está descargándose y el nivel es menor o igual al 15%
if [[ "$battery_status" == "Discharging" && "$battery_level" -le 15 ]]; then
    # Envía una notificación
    notify-send "ENCHUFÁ LA COMPU IMBÉCIL" "Papito me queda: ${battery_level}%"
fi

