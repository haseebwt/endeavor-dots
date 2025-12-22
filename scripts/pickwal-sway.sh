#!/bin/bash

setwal(){

    notify-send "$(basename Current\ Wallpaper)" "$(cat ~/.config/scripts/current_wallpaper.txt)"

    dir="/home/$USER/Pictures/Walls/" # wallpapers folder
    wallpaper=$(cd ~/Pictures/Walls/; for a in *; do echo -en "$a\0icon\x1f$a\n" ; done | rofi -dmenu -theme $HOME/.config/rofi/wallpaper-picker.rasi -p "<3")

    if [ -z "$wallpaper" ]
    then
	notify-send "No wallpaper sent" "Remaining state!"
    else

    swww clear-cache &
    swww img $dir$wallpaper --transition-step 255 --transition-fps 30 --transition-type any

    # Setting pywal
    # sleep 5;
    # wal -i $dir$wallpaper &
    #
    echo $wallpaper > ~/.config/scripts/current_wallpaper.txt

    # Let the user know it's done
    notify-send "Wallpaper set!" 
    fi
}

setwal
