#!/bin/bash

YELLOW='\e[33m'
ORANGE='\e[38;5;208m'
RED='\e[31m'
GREEN='\e[32m'
BLUE='\e[34m'
RESET='\e[0m'

function info()    { echo -e "${BLUE}[*] $1${RESET}"; }
function ok()      { echo -e "${GREEN}[✓] $1${RESET}"; }
function warn()    { echo -e "${ORANGE}[!] $1${RESET}"; }
function error()   { echo -e "${RED}[✗] $1${RESET}"; }

if command -v doas >/dev/null 2>&1; then
    PRIV="doas"
    ok "Usando doas..."
elif command -v sudo >/dev/null 2>&1; then
    PRIV="sudo"
    ok "Usando sudo..."
else
    warn "No hay sudo ni doas en el sistema loco, que desastre"
    exit 1
fi

function imprimirMensaje {
    if command -v figlet &>/dev/null && command -v lolcat &>/dev/null; then
        figlet "Sistema actualizado!" | lolcat
    else
        echo "Sistema actualizado!"
    fi
}

function actualizarGit {
    local archivo="${1:-$HOME/.config/actualizarSistema/repositorios.txt}"
    if [[ ! -f "$archivo" ]]; then
        warn "El archivo $HOME/.config/actualizarSistema/repositorios.txt no existe"
        return
    fi

    info "[*] Actualizando repositorios de Git..."
    local cwd="$(pwd)"

    while IFS= read -r linea; do
        [[ -z "$linea" || "$linea" =~ ^# ]] && continue
        if [[ -d "$linea/.git" ]]; then
            ok "Actualizando $linea..."
            cd "$linea"
            git pull --ff-only
        else
            warn "El repo no es válido"
        fi
    done < "$archivo"

    cd "$cwd"
}

function verificarConexion {
    info "Verificando conexión a internet..."
    if ! ping -c 2 1.1.1.1 &>/dev/null; then
        error "Pibe no tenés internet"
        exit 1
    fi
}

function actualizarAPT {
    ok "Usando APT..."
    $PRIV apt-get update
    $PRIV apt-get full-upgrade -y --autoremove
}

function actualizarPacman {
    ok "Usando Pacman..."
    $PRIV pacman -Syyuu --noconfirm
}

function actualizarYay {
    ok "Usando Yay..."
    yay -Syyuu --noconfirm --aur
}

function actualizarFlatpak {
    ok "Usando Flatpak..."
    flatpak update -y
}

if [[ "$1" == "--help" ]]; then
    echo -e "Script para actualizar el sistema operativo GNU/Linux. Simplemente ejecútelo sin argumentos.\n"
    echo -e "Incluye apt, pacman, yay, flatpak y git"
    echo "Autor: Marcos Raúl Gatica (saludos a LOLON y LULUN)"
    exit 0
fi

verificarConexion

if [[ "$1" == "--git" ]]; then
    actualizarGit
    exit 0
fi

[[ $(command -v apt-get) ]] && actualizarAPT
[[ $(command -v pacman) ]] && actualizarPacman
[[ $(command -v yay) ]] && actualizarYay
[[ $(command -v flatpak) ]] && actualizarFlatpak

imprimirMensaje
unset PRIV
