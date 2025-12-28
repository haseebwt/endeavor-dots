#!/bin/bash
check=$1

volume_step=1
brightness_step=5
max_volume=100
notification_timeout=2000
brightness_icon='󰃠'

get_volume(){
    pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]{1,3}(?=%)' | head -1
}

get_mute(){
    pactl get-sink-mute @DEFAULT_SINK@ | grep -Po '(?<=Mute: )(yes|no)'
}

get_brightness(){
    brightnessctl | grep -Po '[0-9]{1,3}' | head -n 1
}

volume_icon(){
    volume=$(get_volume)
    muted=$(get_mute)

    if [ "$muted" == "yes" ]; then
	icon=''
    elif [ "$volume" -eq 0 ]; then
	icon=''
    elif [ "$volume" -lt 50 ]; then
	icon=''
    else
	icon=''
    fi
}

volume_notifi(){
    volume=$(get_mute)
    volume_icon

    notify-send -t $notification_timeout -r 1 -h string:x-dunst-stack-tag:volume_notif -h int:value:$volume "$volume_icon $volume%" 
}

brightness_notifi(){
    brightness=$(get_brightness)
    notify-send -t $notification_timeout -r 1 -h string:x-dunst-stack-tag:brightness_notif -h int:value:$brightness "$brightness_icon   $brightness%"
}

if [[ $check == 0 ]]; then
    volume_notifi 
elif [[ $check == 1 ]]; then
    brightness_notifi
fi
