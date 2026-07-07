#include <stdio.h>

int main(void) {
    FILE* archivoSensorCrudo = NULL;
    unsigned int temperatura = 0;

    archivoSensorCrudo = fopen("/run/hwmon-k10temp/temp1_input", "r");

    if (!archivoSensorCrudo) {
        printf("^c#fb4934^ TEMP ERR ^d^\n");
        return 1;
    }

    if (fscanf(archivoSensorCrudo, "%u", &temperatura) != 1) {
        printf("^c#fb4934^ TEMP ERR ^d^\n");
        fclose(archivoSensorCrudo);
        return 1;
    }
    fclose(archivoSensorCrudo);
    printf("TEMP %u \n", temperatura / 1000);

    return 0;
}
