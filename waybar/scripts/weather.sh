#!/usr/bin/env bash

# VARIABLES
API_KEY="https://api.open-meteo.com/v1/forecast?latitude=24.8608&longitude=67.0104&current=temperature_2m,rain,precipitation,showers,weather_code,is_day&timezone=auto&forecast_days=1"


RESPONSE=$(curl -s "$API_KEY");

# Check if curl failed to get a response
if [ -z "$RESPONSE" ]; then
    echo "No connection"
    exit 1
fi

# Temperature
TEMP=$(echo "$RESPONSE" | jq '.current.temperature_2m | round')

# Description
WEATHER_CODE=$(echo "$RESPONSE" | jq '.current.weather_code')

case "$WEATHER_CODE" in
        "0") DESC="clear sky";;
        "1") DESC="mainly clear";;
        "2") DESC="partly cloudy";;
        "3") DESC="overcast";;
        "45"|"48") DESC="fog";;
        "51") DESC="light drizzle";;
        "53") DESC="moderate drizzle";;
        "55") DESC="dense intensity drizzle";;
        "61") DESC="slight rain";;
        "63") DESC="moderate rain";;
        "65") DESC="heavy rain";;
        "80") DESC="slight rain shower";;
        "81") DESC="moderate rain shower";;
        "82") DESC="violent rain shower";;
        "95") DESC="thunderstorm";;
        *) echo "Can't fetch detail!";;
esac

# Day or night
IS_DAY=$(echo "$RESPONSE" | jq '.current.is_day')

# ICON
case $WEATHER_CODE in
    "0") 
        if [[ $IS_DAY == 0 ]]; then
                ICON="🌙"  # Clear sky night
        else
                ICON="☀️"  # Clear sky day       
        fi;;
    "1"|"2"|"3")
        if [[ $IS_DAY == 0 ]]; then
                ICON="☁️"  # Few clouds night
        else
                ICON="⛅"  # Few clouds day
        fi;;
    "51"|"53"|"55") ICON="☁️";; # Drizzle
    "61"|"63"|"65"|"80"|"81"|"82") ICON="🌧️";; # Rain
    "95"|"96"|"99") ICON="⛈️";; # Thunderstorm
    "45"|"48") ICON="🌫️";; # Mist
    *) ICON="❓";;      # Default
esac

# Unit
UNIT="°C"

# output for Waybar
echo "{\"text\": \"${ICON} ${TEMP}${UNIT}\", \"alt\": \"${DESC}\"}"
