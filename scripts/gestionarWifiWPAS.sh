#!/bin/bash

INTERFACE="wlp4s0"

redesDisponibles() {
    clear
    echo "----------------------------------------------"
    echo "              Redes disponibles               "
    echo "----------------------------------------------"
    sudo iwlist $INTERFACE scan | grep -E "ESSID|Signal"

}

while true; do
    clear
    echo "----------------------------------------------"
    echo "                Gestor WiFi                   "
    echo "----------------------------------------------"
    echo "                 v0.5beta                     "
    echo "----------------------------------------------"
    echo "1. Redes disponibles"
    echo "2. Agregar nueva red WiFi"
    echo "3. Conectar el WiFi"
    echo "4. Ver redes conocidas"
    echo "5. Es mel? "
    echo "6. Salir y guardar"
done

