#!/bin/bash

interfaceWifi="wlp4s0"
interfaceEthernet="enp3s0"

wifiState=$(ip link show $interfaceWifi | grep 'state UP')
wifiSSID=$(iwgetid -r)

ethState=$(ip link show $interfaceEthernet | grep 'state UP')

getName() {
    if [ -f "/tmp/networkShowDetails" ]; then
        wifiIP=$(ip -4 addr show $interfaceWifi | grep -oP '(?<=inet\s)\d+(\.\d+){3}' || echo "Desconectado")
        ethIP=$(ip -4 addr show $interfaceEthernet | grep -oP '(?<=inet\s)\d+(\.\d+){3}' || echo "Desconectado")

        if [ -n "$wifiSSID" ]; then
            echo "$interfaceWifi: $wifiIP"
        elif [ -n "$ethState" ]; then
            echo "$interfaceEthernet: $ethIP"
        else
            echo "Sin conexión"
        fi
    else
        if [ -n "$wifiSSID" ]; then
            echo "$wifiSSID "
        elif [ -n "$ethState" ]; then
            echo "Ethernet"
        else
            echo "Desconectado "
        fi
    fi
}

getIcon() {
    if [ -n "$wifiSSID" ]; then
        echo -e "󰖩"
    elif [ -n "$ethState" ]; then
        echo -e " "
    else
        echo -e " "
    fi
}

if [[ "$1" == "--get-info-red" ]]; then
    if [ -f "/tmp/networkShowDetails" ]; then
        rm "/tmp/networkShowDetails"
    else
        touch "/tmp/networkShowDetails"
    fi
    exit 0
fi

if [[ "$1" == "--get-name" ]]; then
    getName
    exit 0
fi

if [[ "$1" == "--get-icon" ]]; then
    getIcon
    exit 0
fi

echo -e "BOLUDO"
