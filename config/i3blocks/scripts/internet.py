#!/usr/bin/env python3
import socket
import subprocess
import os

def isInterfaceUp(interface):
    try:
        with open(f"/sys/class/net/{interface}/operstate", "r") as f:
            return f.read().strip() == "up"
    except:
            return False

def getWifiSSID(interface):
    try:
        output = subprocess.check_output(["iwgetid", interface, "-r"], universal_newlines=True)
        return output.strip()
    except:
        return "N/A"

def getIPAddress(interface):
    try:
        output = subprocess.check_output(["ip", "-4", "addr", "show", interface,], universal_newlines=True)
        for line in output.split("\n"):
            if "inet " in line:
                return line.split()[1].split("/")[0]
        return "N/A"
    except:
        return "N/A"

def main():

    interfaces = ["wlan0", "wlp4s0", "enp3s0"]

    foundConnection = False
    netInfo = ""

    for interface in interfaces:
        if isInterfaceUp(interface):
            ip = getIPAddress(interface)

            if ip != "N/A":
                if interface.startswith("wl"):
                    ssid = getWifiSSID(interface)
                    if ssid and ssid != "N/A":
                        netInfo = f"{ssid}: {ip}"
                    else:
                        netInfo = f"W: {ip}"
                else:
                    netInfo = f"E: {ip}"

                foundConnection = True
                break
    if foundConnection:
        print(netInfo)

if __name__ == "__main__":
    main()
