#!/bin/bash

function instalacionDebian {
    echo "PROCESO 1: ACTUALIZACIÓN"
    apt update
    apt full-upgrade
    apt autoremove && apt autoclean
    
    echo "PREPARACIÓN: CONFIGURAR LAS VELOCIDADES DEL CPU Y VENTILADORES"
    apt install linux-cpupower lm-sensors
    cpupower frequency-set --governor powersave --min 800MHz --max 1.60GHz

    echo "PROCESO 2: INSTALACIÓN DE PAQUETES BASE"
    apt install i3 vim git alacritty tmux firefox-esr sudo rofi polybar dusnt xorg xorg-xinit feh evince zsh build-essential flameshot eom ssh sshfs texlive texlive-latex-extra texlive-lang-spanish fonts-font-awesome

    echo "SUBPROCESO 2A: INSTALACIÓN HACK NERD FONT"
    mkdir -p ~/.local/share/fonts
    cd ~/.local/share/fonts
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip
    unzip Hack.zip
    rm *.md
    fc-cache -fv
}

function instalacionArchLinux {
    echo "PROCESO 1: ACTUALIZACIÓN"
    pacman -Syu
}

echo "Sistema base: "

if [ -f /etc/debian_version ]; then
    sistemaBase=2 
    echo "Debian"
elif [ -f /etc/arch-release ]; then
    sistemaBase=1
    echo "Arch Linux"
else
	echo "Sistema no soportado"
	exit 1
fi


