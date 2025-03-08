#!/bin/bash

mostrarInfo() {
    interfazWifi="wlp4s0"
    interfazEth="enp3s0"

    wifiIP=$(ip -4 addr show $interfazWifi | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
    ethIP=$(ip -4 addr show $interfazEth | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
    info=""

    if [ -n "$wifiIP" ]; then
        info+=" WiFi: $wifiIP\n"
    else
        info+=" WiFi: Desconectado\n"

    fi

    if [ -n "$ethIP" ]; then
        info+=" Ethernet: $ethIP\n"
    else
        info+=" Ethernet: Desconectado\n"
    fi

    if [ -z "$wifiIP" ] && [ -z "$ethIP" ]; then
        info=" No tenés internet pibe"
    fi

    echo -e "$info" | rofi -dmenu -p "Información de las redes" -theme-str 'window {width: 300px; height: 100px;}'
}

mostrarInfo
