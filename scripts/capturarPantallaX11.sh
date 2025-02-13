#!/bin/bash -e

directorio=$HOME/Capturas
nombreArchivo="captura_$(date +'%Y-%m-%d_%H-%M-%S').png"
nombreRutaGuardado="$directorio/$nombreArchivo"
export nombreRutaGuardado

maim -s | tee >(xclip -selection clipboard -t image/png) > "$nombreRutaGuardado"
python3 $HOME/.config/utilidadesYSistema/scripts/codigosPython/interfazCapturarPantalla.py
