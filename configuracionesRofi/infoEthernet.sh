#!/bin/bash

ETH="enp3s0"

IP=$(ip addr show $ETH | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
MAC=$(ip link show $ETH | awk '/ether/ {print $2}')
GATEWAY=$(ip route | grep default | grep $ETH | awk '{print $3}')
PUBLIC_IP=$(curl -s ifconfig.me)

echo -e "Estado: $(cat /sys/class/net/$ETH/operstate)\nIP local: $IP\nIP pública: $PUBLIC_IP\nMAC: $MAC\nPuerta de enlace: $GATEWAY" | \
rofi -dmenu \
     -i \
     -p "Información de Ethernet" \
     -theme-str 'window {width: 600px;}' \
     -no-custom
