#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_SIZE_PATH 256
#define MAX_SIZE_STATUS 16
#define MAX_SIZE_CMD 256
#define MAX_SIZE_LINE 512
#define MAX_SIZE_IP 64
#define MAX_SIZE_SSID 128

int isInterfaceUp(const char*);
void getIPAddress(const char*, char*, size_t);
void getWifiSSID(const char*, char*, size_t);

int main() {
    const char* interfaces[] = {"wlan0", "wlp4s0", "enp3s0", "wlp1s0"};
    char ip[MAX_SIZE_IP] = {0};
    char ssid[MAX_SIZE_SSID] = {0};
    unsigned int found = 0;

    for (int i = 0; i < 3; ++i) {
        if (isInterfaceUp(interfaces[i])) {
            getIPAddress(interfaces[i], ip, sizeof(ip));
            if (strncmp(interfaces[i], "wl", 2) == 0) {
                getWifiSSID(interfaces[i], ssid, sizeof(ssid));
                (strcmp(ssid, "N/A") != 0) ? printf("^b#3c3836^^c#ebdbb2^   %s: %s ^d^\n", ssid, ip) : printf("   : %s \n", ip);
                
            } else {
                printf("   : %s \n", ip);
            }
            found = 1; break;
        }
    }
    return 0;
}

int isInterfaceUp(const char* interface) {
    char path[MAX_SIZE_PATH] = {0};
    snprintf(path, sizeof(path), "/sys/class/net/%s/operstate", interface);

    FILE* f = fopen(path, "r");

    if (!f) return 0;

    char status[MAX_SIZE_STATUS] = {0};

    if (fgets(status, sizeof(status), f)) {
        fclose(f);
        return (strncmp(status, "up", 2) == 0);
    }
    
    fclose(f);
    return 0;
}

void getIPAddress(const char* interface, char* ip, size_t ipSize){
    char cmd[MAX_SIZE_CMD] = {0};
    snprintf(cmd, sizeof(cmd), "hostname -I", interface);

    FILE* fp = popen(cmd, "r");
    if (!fp) { strncpy(ip, "N/A", ipSize); return; }

    (!fgets(ip, ipSize, fp)) ? strncpy(ip, "N/A", ipSize) : ip[strcspn(ip, "\n")] = '0';
    pclose(fp);
}

void getWifiSSID(const char* interface, char* ssid, size_t ssidSize) {
    FILE* fp = popen("commanctl services", "r");
    if (!fp) { strncpy(ssid, "N/A", ssidSize); return; }

    char line[MAX_SIZE_LINE] = {0};
    while (fgets(line, sizeof(line), fp)) {
        if (line[0] == '*') {
            char* wifiPtr = strstr(line, "wifi_");
            if (wifiPtr) {
                char* ssidStart = strchr(line, ' ');
                if (ssidStart) {
                    ++ssidStart;
                    size_t len = wifiPtr - ssidStart;
                    if (len > 0 && len < ssidSize) {
                        strncpy(ssid, ssidStart, len);
                        ssid[len] = '\0';
                        pclose(fp);
                        return;
                    }
                }
            }
        }
    }
    pclose(fp);
    strncpy(ssid, "N/A", ssidSize);
}

