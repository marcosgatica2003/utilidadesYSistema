#!/bin/bash
# servicioDeAudio - Script para controlar PipeWire
# Uso: servicioDeAudio [--activar|--apagar|--estado|--ayuda]

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

function instalar {
    cat /home/marcosgatica/.config/utilidadesYSistema/scripts/servicioDeAudio.sh > /usr/local/bin/servicioDeAudio
    $PRIV chmod +x /usr/local/bin/servicioDeAudio
    ok "Script copiado a /usr/local/bin"
}

SERVICES=("pipewire.service" "pipewire-pulse.service" "wireplumber.service")
SOCKETS=("pipewire.socket" "pipewire-pulse.socket")
MASK_FILE="$HOME/.local/share/audio-disabled-mask"

mostrarAyuda() {
    cat << EOF
Uso: $(basename "$0") [OPCIÓN]

OPCIONES:
    --activar    Activa los servicios de audio (PipeWire)
    --apagar     Desactiva los servicios de audio
    --estado     Muestra el estado actual de los servicios
    --ayuda      Muestra esta ayuda

EJEMPLOS:
    $(basename "$0") --activar
    $(basename "$0") --apagar
    $(basename "$0") --estado

EOF
}

activarAudio() {
    info "Activando servicios de audio..."

    for service in "${SERVICES[@]}"; do
        systemctl --user unmask "$service" 2>/dev/null
    done
    
    for socket in "${SOCKETS[@]}"; do
        systemctl --user unmask "$socket" 2>/dev/null
    done

    for service in "${SERVICES[@]}"; do
        systemctl --user enable "$service" 2>/dev/null
        systemctl --user start "$service"
        if [ $? -eq 0 ]; then
            ok "✓ $service activado"
        else
            error "✗ Error activando $service"
        fi
    done

    rm -f "$MASK_FILE"
}

desactivarAudio() {
    info "Desactivando servicios de audio..."

    for service in "${SERVICES[@]}"; do
        systemctl --user stop "$service" 2>/dev/null
        systemctl --user disable "$service" 2>/dev/null
    done
    
    for socket in "${SOCKETS[@]}"; do
        systemctl --user stop "$socket" 2>/dev/null
        systemctl --user disable "$socket" 2>/dev/null
    done

    pkill -f pipewire 2>/dev/null
    pkill -f wireplumber 2>/dev/null

    for service in "${SERVICES[@]}"; do
        systemctl --user mask "$service"
        if [ $? -eq 0 ]; then
            ok "$service desactivado"
        else
            error "Error desactivando $service"
        fi
    done

    for socket in "${SOCKETS[@]}"; do
        systemctl --user mask "$socket" 2>/dev/null
        ok "$socket enmascarado"
    done

    mkdir -p "$(dirname "$MASK_FILE")"
    touch "$MASK_FILE"

}

mostrarEstado() {
    info "Estado de los servicios de audio:"

    if [ -f "$MASK_FILE" ]; then
        info "Audio DESACTIVADO"
        echo ""
    fi

    for service in "${SERVICES[@]}"; do
        status=$(systemctl --user is-active "$service" 2>/dev/null)
        enabled=$(systemctl --user is-enabled "$service" 2>/dev/null)
        printf "%-25s Estado: %-10s Habilitado: %s\n" "$service" "$status" "$enabled"
    done

    echo ""
    info "Sockets:"
    for socket in "${SOCKETS[@]}"; do
        status=$(systemctl --user is-active "$socket" 2>/dev/null)
        enabled=$(systemctl --user is-enabled "$socket" 2>/dev/null)
        printf "%-25s Estado: %-10s Habilitado: %s\n" "$socket" "$status" "$enabled"
    done

    if pgrep -f pipewire > /dev/null; then
        echo ""
        info "Procesos PipeWire activos:"
        pgrep -fl pipewire
    fi

}

# Función principal
case "${1:-}" in
    --activar)
        activarAudio
        ;;
    --apagar)
        desactivarAudio
        ;;
    --estado)
        mostrarEstado
        ;;
    --ayuda|"")
        mostrarAyuda
        ;;
    --instalar)
        instalar
        ;;
    *)
        error "Opción no válida: $1"
        info "Use --ayuda para ver las opciones disponibles"
        exit 1
        ;;
esac
