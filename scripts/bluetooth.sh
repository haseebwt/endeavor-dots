#!/usr/bin/env bash

devices=$(bluetoothctl devices | awk -F: '!seen[$1]++{print "🎧" $6}' | cut -d " " -f 2)

chosen_devices=$(echo -e "$devices" | rofi -dmenu  -p "Devices") 

echo -e "$devices"
chosen_devices
