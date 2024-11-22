#!/bin/bash

# Verifica que se haya proporcionado al menos un argumento
if [ $# -eq 0 ]; then
    echo "Uso: $0 <archivo1> [<archivo2> ...]"
    exit 1
fi

# Iterar sobre todos los argumentos proporcionados
for target in "$@"
do
    # Verifica que el objetivo exista
    if [ ! -e "$target" ]; then
        echo "Error: El archivo o directorio '$target' no existe."
        continue
    fi

    # Pregunta al usuario si desea proceder
    read -p "¿Quieres proceder a borrar el archivo/directorio '$target'? (Y/N): " response

    # Verifica la respuesta del usuario
    if [ "$response" = "Y" -o "$response" = "y" ]; then
        # Ejecuta el comando rm -rf
        rm -rf "$target"
        echo "¡Se ha borrado '$target'!"
    elif [ "$response" = "N" -o "$response" = "n" ]; then
        echo "Operación cancelada para '$target'."
    else
        echo "Respuesta no válida. Operación cancelada para '$target'."
    fi
done

