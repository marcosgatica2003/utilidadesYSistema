#!/bin/bash

mostrarInfo() {
    interfazWifi="wlp4s0"
    interfazEth="enp3s0"

    wifiIP=$(ip -4 addr show $interfazWifi | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
    ethIP=$(ip -4 addr show $interfazEth | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
    info=""

    if [ -n "$wifiIP" ]; then
        info+=" \tWiFi: $wifiIP\n"
    else
        info+=" \tWiFi: Desconectado\n"

    fi

    if [ -n "$ethIP" ]; then
        info+=" \tEthernet: $ethIP\n"
    else
        info+=" \tEthernet: Desconectado\n"
    fi

    if [ -z "$wifiIP" ] && [ -z "$ethIP" ]; then
        info=" \tNo tenés internet pibe"
    fi

    echo -e "$info" | rofi -dmenu -p "" -theme $HOME/.config/polybar/scripts/temainfoWifi.rasi
}

mostrarInfo
