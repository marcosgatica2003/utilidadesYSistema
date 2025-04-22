/* Yael estuvo aquí */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void colores(int capa) {
    if (capa <= 10) { printf("#FF0000\n"); }

    if (capa <= 25) { printf("#FFAE00\n"); } 

    if (capa >= 90) { printf("#00FF00\n"); } 
}

int main() {
    FILE *archivoCapacidad;
    unsigned int capacidad;

    archivoCapacidad = fopen("/sys/class/power_supply/BAT1/capacity", "r");

    if (archivoCapacidad == NULL) {fprintf(stderr,"Error al acceder a la batería"); return 1;}

    fscanf(archivoCapacidad, "%d", &capacidad);
    fclose(archivoCapacidad);

    printf("%d%%\n", capacidad);

    colores(capacidad);

    return 0;
}


