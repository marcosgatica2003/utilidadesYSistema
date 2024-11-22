#!/bin/bash

function imprimirMensaje {
	echo "---- Sistema actualizado! ----"
}

if [ -f /etc/debian_version ]; then
	sudo apt update
	sudo apt full-upgrade
	imprimirMensaje
elif [ -f /etc/arch-release ]; then
	sudo pacman -Syu
	yay --aur -Syu
	imprimirMensaje
else
	echo "Sistema no soportado"
	exit 1
fi
