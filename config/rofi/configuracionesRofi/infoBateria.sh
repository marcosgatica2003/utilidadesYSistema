#!/bin/bash
BATERIA="/sys/class/power_supply/BAT1"

getStatus() {
    status=$(cat "$BATERIA/status")
    echo "$status"
}

getCapacity() {
    capacity=$(cat "$BATERIA/capacity")
    echo "$capacity"
}

getIcon() {
    status=$(getStatus)
    if [ "$status" = "Full" ]; then
        echo ""
        return
    fi

    capacity=$(getCapacity)
    case $capacity in
        9[0-9]|100) echo " " ;;
        7[5-9]|8[0-9]) echo " " ;; 
        5[0-9]|6[0-9]) echo " " ;; 
        2[5-9]|3[0-9]|4[0-9]) echo " " ;;
        *) echo " " ;; 
    esac
}

if [ "$1" = "--get-icon" ]; then
    getIcon
    exit 0
fi

if [ "$1" = "--get-info" ]; then
    icon=$(getIcon)
    capacity=$(getCapacity)
    status=$(getStatus)
    echo -e "$icon Capacidad: $capacity%\nEstado: $status" | rofi -dmenu -p "BATERÍA"
    exit 0
fi

echo "Sos un boludo tenes que usar el script como [--get-icon] o [--get-info]. Báñate virgen"
exit 1
