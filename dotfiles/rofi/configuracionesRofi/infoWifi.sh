#!/bin/bash

INTERFACE="wlp4s0"

SSID=$(iwgetid -r)
IP=$(ip addr show $INTERFACE | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
MAC=$(ip link show $INTERFACE | awk '/ether/ {print $2}')
GATEWAY=$(ip route | grep default | awk '{print $3}')
PUBLIC_IP=$(curl -s ifconfig.me)

echo -e "Red actual: $SSID\nIP local: $IP\nIP pública: $PUBLIC_IP\nMAC: $MAC\nPuerta de enlace: $GATEWAY" | rofi -dmenu -p "     INFORMACIÓN DE LA RED" -font "Hack Nerd Font Bold 11" -theme $HOME/.config/utilidadesYSistema/configuracionesRofi/temainfoWifi.rasi -xoffset -290 -yoffset 400 -no-show-icons -disable-history
