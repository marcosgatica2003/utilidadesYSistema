#!/bin/bash

function instalacionDebian {
    echo "PROCESO 1: ACTUALIZACIÓN"
    apt update
    apt full-upgrade
    apt autoremove && apt autoclean
    
    echo "PROCESO 2: CAMBIAR KERNEL"
    wget -qO - https://dl.xanmod.org/archive.key | gpg --dearmor -vo /etc/apt/keyrings/xanmod-archive-keyring.gpg
    echo 'deb [signed-by=/etc/apt/keyrings/xanmod-archive-keyring.gpg] http://deb.xanmod.org releases main' | tee /etc/apt/sources.list.d/xanmod-release.list
    apt update && apt install linux-xanmod-x64v3
    reboot
    
    echo "PREPARACIÓN: CONFIGURAR LAS VELOCIDADES DEL CPU Y VENTILADORES"
    apt install linux-cpupower lm-sensors
    cpupower frequency-set --governor powersave --min 800MHz --max 1.60GHz

    echo "PROCESO 2: INSTALACIÓN DE PAQUETES BASE"
    apt install i3 vim git alacritty tmux firefox-esr sudo rofi polybar dunst xorg xorg-xinit feh evince zsh build-essential flameshot eom ssh sshfs texlive texlive-latex-extra texlive-lang-spanish fonts-font-awesome

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

    echo "PREPARACIÓN: CONFIGURAR LAS VELOCIDADES DEL CPU Y VENTILADORES"
    pacman -S lm_sensors cpupower
    cpupower frequency-set --governor powersave --min 800MHz --max 1.60GHz
    pwmconfig

    echo "PROCESO 2: INSTALACIÓN DE PAQUETES BASE"
    pacman -S alacritty tmux vim i3-wm git sudo polybar dunst xorg xinit feh evince base-devel flameshot openssh sshfs texlive-full ttf-font-awesome ttf-hack-nerd rofi discord eom zathura zathura-pdf-poppler 

    echo "PROCESO 3: INSTALACIÓN DE YAY"
    cd /tmp/
    git clone https://aur.archlinux.org/yay.git && cd /tmp/yay && makepkg -si

    echo "PROCESO 4: INSTALACIÓN DE PAQUETES YAY"
    yay -Syu
    yay -S librewolf-bin simplescreenrecorder latexmk

    echo "PROCESO 5: INSTALACIÓN DE ARCHIVOS CONFIG"
    ./installConfig.sh
}

echo -e "---------------------------------------------"
echo -e "| Script de instalación  de mi sistema base |"
echo -e "---------------------------------------------"

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
echo -e "---------------------------------------------"


