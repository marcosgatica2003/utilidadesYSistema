#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define MAX_BUF_SIZE 256

int ejecutar(const char* cmd, char* output, size_t outputSize) {

    FILE* fp;

    fp = popen(cmd, "r");
    if (fp == NULL) { return -1; }

    if (fgets(output, outputSize, fp) == NULL) { 
        pclose(fp); 
        return -1; 
    }

    size_t len = strlen(output);
    if (len > 0 && output[len-1] == '\n') { output[len-1] == '\0'; }

    pclose(fp);
    return 0;
}

int estaMuteado() {
    char buffer[MAX_BUF_SIZE];
    if (ejecutar("amixer get Master | grep -o '\\[off\\]'", buffer, MAX_BUF_SIZE) == 0) { return 1; } //muteado
    return 0; //desmuteado
}

void getVolumen(char* volume, size_t volumeSize) {
    char buffer[MAX_BUF_SIZE];

    if(ejecutar("amixer get Master | grep -o '[0-9]\\+%' | head -1", buffer, MAX_BUF_SIZE) == 0) {
        strncpy(volume, buffer, volumeSize);
        volume[volumeSize-1] = '\0';
    } else {
        strncpy(volume, "?%", volumeSize);
        volume[volumeSize-1] = '\0';
    }
}

void click(int button) {
    switch (button) {
        case 1:
            system("amixer -q set Master toggle");
            break;
        case 3:
            system("GTK_THEME='Adwaita:dark' pavucontrol &");
            break;
        case 4:
            system("amixer -q set Master 5%+");
            break;
        case 5:
            system("amixer -q set Master 5%-");
            break;
    }
}

int main() {
    char volume[MAX_BUF_SIZE];
    int muted;
    char* blockButton = getenv("BLOCK_BUTTON");

    if (blockButton != NULL) {
        click(atoi(blockButton));
    }

    muted = estaMuteado();
    getVolumen(volume, MAX_BUF_SIZE);

    if ( muted ) { printf("OFF\n"); }
    else { printf("%s\n"); }

    return 0;
}


