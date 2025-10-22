#!/bin/bash

check=$1

shut(){
    do_it=$(ls $HOME/.config/scripts/opts/ | rofi -dmenu -p 'pakka?' -config $HOME/.config/rofi/system.rasi)
    if [[ $do_it == *yes* ]]; then
	notify-send "Byee byee"
	systemctl poweroff
    fi
}

restart(){

    do_it=$(ls $HOME/.config/scripts/opts/ | rofi -dmenu -p 'pakka?' -config $HOME/.config/rofi/system.rasi)
    if [[ $do_it == *yes* ]]; then
	systemctl reboot
    fi

}

if [[ $check == 0 ]]; then
    shut
elif [[ $check == 1 ]]; then
    restart
fi
