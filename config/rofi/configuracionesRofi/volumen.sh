#!/bin/bash -e

getVolumen() {
    volumen=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]{1,3}(?=%)' | head -1)
    if [[ -z "$volumen" ]]; then
        echo -e "0%"
    else
        echo -e "$volumen"
    fi
}

muteado() {
    muted=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
    if [[ "$muted" == "sí" ]]; then
        echo -e "sí"
    else
        echo -e "no"
    fi
}

getIcon() {
    muted=$(muteado)
    volumen=$(getVolumen)

    if [[ "$muted" == "sí" || "$volumen" -eq 0 ]]; then
        echo "󰝟"
        return
    fi

    if [[ "$volumen" -lt 30 ]]; then
        echo "󰕿"
    elif [[ "$volumen" -lt 70 ]]; then
        echo "󰖀"
    else
        echo "󰕾"
    fi
}

case "$1" in
    --get-volumen)
        getVolumen
        ;;
    --get-icon)
        getIcon
        ;;
    --esta-muteado)
        muteado
        ;;
    *)
        echo -e "Uso: $0 {--get-volumen|--get-icon|--esta-muteado}"
        exit 1
        ;;
esac
