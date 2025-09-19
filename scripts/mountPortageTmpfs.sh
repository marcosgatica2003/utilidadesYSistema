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

function verificarPrivilegios {
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
}

if ! command -v emerge >/dev/null 2>&1; then
    error "Esto no es Gentoo papi"
    exit 1
fi

info "Tamaño del tmpfs (en G)"
read -p "-> " SIZE
verificarPrivilegios

[[ ! -d /var/tmp/portage ]] && mkdir -p /var/tmp/portage
$PRIV mount -t tmpfs -o size=$SIZE,mode=1777 tmpfs /var/tmp/portage
ok "Montado con tamaño $SIZE:"
df -h /var/tmp/portage

