#!/bin/bash
TEMP=$(sensors | grep 'Core 0' | grep -oP '[-+]?\d+\.\d+')
echo "$TEMP"
