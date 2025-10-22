#!/bin/bash

change(){
    test=$(fastfetch -c ~/.config/fastfetch/new.jsonc | grep "WM")

    if [[ $test == *Sway* ]]; then

	mv ~/.config/waybar/style.css ~/.config/waybar/hypr.css &&
	mv ~/.config/waybar/sway.css ~/.config/waybar/style.css &&
	mv ~/.config/waybar/config.jsonc ~/.config/waybar/hypr.jsonc &&
	mv ~/.config/waybar/sway.jsonc ~/.config/waybar/config.jsonc

	pkill waybar && waybar

	notify-send "Success" "Changed dots to Sway"

    fi

    if [[ $test == *Hyprland* ]]; then

	mv ~/.config/waybar/style.css ~/.config/waybar/sway.css &&
	mv ~/.config/waybar/hypr.css ~/.config/waybar/style.css &&
	mv ~/.config/waybar/config.jsonc ~/.config/waybar/sway.jsonc &&
	mv ~/.config/waybar/hypr.jsonc ~/.config/waybar/config.jsonc

	pkill waybar && waybar

	notify-send "Success" "Changed dots to Hyprland"
    fi
}

change
