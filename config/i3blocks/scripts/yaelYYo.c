/* No hace falta decir que yael estuvo aquí jeje */

#define MAX_BUF_SIZE 512
#ifdef __linux__
    #define _POSIX_C_SOURCE 200809L
#endif

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int checkIfWindowExist(const char*);
void openImage();
void click(int);

int main(void) {
    char* blockButton = getenv("BLOCK_BUTTON");

    if(blockButton != NULL) { click(atoi(blockButton)); }
    printf(" \n");

    return 0;
}

int checkIfWindowExist(const char* windowName) {
    char command[MAX_BUF_SIZE];
    char buffer[MAX_BUF_SIZE];
    FILE* fp;

    snprintf(command, sizeof(command), "wmctrl -l | grep \"%s\" ", windowName);

    fp = popen(command, "r"); 
    if (fp == NULL) { return 0; }

    if (fgets(buffer, sizeof(buffer), fp) != NULL) { pclose(fp); return 1; }

    pclose(fp);

    return 0;
}

void openImage() {
    if(checkIfWindowExist("yaelYYO")) { return; }

    const char* home = getenv("HOME");

    if(home == NULL) { fprintf(stderr, "home es null"); return; }
    
    char imagePath[MAX_BUF_SIZE];
    char command[1024];

    if(sprintf(imagePath, "%s/.config/i3blocks/scripts/yael.jpg", home) >= sizeof(imagePath)) {
        fprintf(stderr, "ruta de imagen larga");
        return;
    }

    if(sprintf(command, "feh --scale-down --geometry 300x400+1200+40 --title \"yaelYYO\" \"%s\" &", imagePath)){
        fprintf(stderr, "comando largo");
        return; 
    }

    system(command);
}

void click(int button) {
    switch (button) {
        case 1:
            openImage();
            break;
        case 3:
            openImage();
            break;
    }
}

