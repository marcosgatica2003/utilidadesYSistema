#!/bin/bash 

API_KEY="1279edbefb9c0da0093687147353740d"
CIUDAD="Cordoba,AR"
UNIDADES="metric"

CACHE_DIR="$HOME/.cache/polybar-weather"
CACHE_FILE="$CACHE_DIR/weather.json"

mkdir -p "$CACHE_DIR"

updateWeather() {
    curl -sf "http://api.openweathermap.org/data/2.5/weather?q=$CIUDAD&appid=$API_KEY&units=$UNIDADES" -o "$CACHE_FILE"
}

if [ ! -f "$CACHE_FILE" ] || [ $(( $(date +%s) - $(stat -c %Y "$CACHE_FILE") )) -gt 21600 ]; then
    updateWeather
fi

getWeatherData() {
    local TYPE=$1
    local DATA=$(cat "$CACHE_FILE")
    
    if [ ! -z "$DATA" ]; then
        case $TYPE in
            icon)
                CONDICION=$(echo "$DATA" | jq -r ".weather[0].main")
                case $CONDICION in
                    Clear) echo "";;
                    Clouds) echo "";;
                    Rain) echo "";;
                    Drizzle) echo "";;
                    Thunderstorm) echo "";;
                    Snow) echo "";;
                    Mist|Fog|Haze) echo "";;
                    *) echo "";;
                esac
                ;;
            temp)
                echo "$(echo "$DATA" | jq -r ".main.temp")°C"
                ;;
            *)
                echo "Error: Tipo de dato no válido"
                ;;
        esac
    else
        echo "Error"
    fi
}

getWeatherData "$1"
