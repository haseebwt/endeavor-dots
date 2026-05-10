#!/bin/bash


setwal(){

    notify-send "$(basename Current\ Wallpaper)" "$(cat ~/.config/scripts/current_wallpaper.txt)"

    dir="/home/$USER/Pictures/Walls/" # wallpapers folder
    wallpaper=$(cd ~/Pictures/Walls/; for a in *; do echo -en "$a\0icon\x1f$a\n" ; done | rofi -dmenu -theme $HOME/.config/rofi/wallpaper-picker.rasi -p "<3")

    if [ -z "$wallpaper" ]
    then
	notify-send "No wallpaper sent. Remaining state!"
    else
    # Path to your hyprpaper configuration file
    hyprpaper_config_file="$HOME/.config/hypr/hyprpaper.conf"

    # Update the config file with the new wallpaper path 
    sed -i -e "s|^preload = .*$|preload = $dir$wallpaper|" \
	   -e "s|^wallpaper = .*$|wallpaper = ,$dir$wallpaper|" \
	   "$hyprpaper_config_file"

    # Monitor
    monitor=`hyprctl monitors | grep Monitor | awk '{print $2}'`

    awww clear-cache &
    awww img $dir$wallpaper --transition-step 255 --transition-fps 30 --transition-type any

    sleep 2; 

    # Setting pywal
    # wal -i $dir$wallpaper

    echo $wallpaper > ~/.config/scripts/current_wallpaper.txt

    # Let the user know it's done
    notify-send "Wallpaper set!" 
    fi
}

setwal
