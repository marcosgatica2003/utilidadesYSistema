#!/bin/bash

interfaceWifi="wlp4s0"
interfaceEthernet="enp3s0"

wifiState=$(ip link show $interfaceWifi | grep 'state UP')
wifiSSID=$(iwgetid -r)

ethState=$(ip link show $interfaceEthernet | grep 'state UP')

getName() {
    if [ -n "$wifiSSID" ]; then
        echo "$wifiSSID "
    elif [ -n "$ethState" ]; then
        echo "Ethernet"
    else
        echo "Sin conexión"
    fi
}

getIcon() {
    if [ -n "$wifiSSID" ]; then
        echo -e " "
    elif [ -n "$ethState" ]; then
        echo ""
    else
        echo ""
    fi
}

if [[ "$1" == "--get-name" ]]; then
    getName
    exit 0
fi

if [[ "$1" == "--get-icon" ]]; then
    getIcon
    exit 0
fi

echo -e "BOLUDO"
