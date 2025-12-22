#!/bin/bash

check=$(ls $HOME/Videos/Screen/)

if pid=$(pgrep wf-recorder); then
	kill -s INT "$pid"
	: > /tmp/RECORDING

else
    file=$(rofi -dmenu -p "Enter File Name: ")

    if [[ $check == *$file* ]]; then
	rofi -theme-str 'window {height: 8%; width: 34%;}' -e "File exists already."

	out=$(rofi -dmenu -p "Override?" -theme-str 'window {height: 8%; width: 34%;}')

	if [[ $out == 'y' ]]; then
	    wf-recorder --audio=alsa_output.pci-0000_00_1b.0.analog-stereo.monitor  -f $HOME/Videos/Screen/$file &
	    echo '' > /tmp/RECORDING

	else
	    file=$(rofi -dmenu -p "Enter File Name: ")
	    wf-recorder --audio=alsa_output.pci-0000_00_1b.0.analog-stereo.monitor -f $HOME/Videos/Screen/$file &
	    echo '' > /tmp/RECORDING
	fi
    else
	wf-recorder --audio=alsa_output.pci-0000_00_1b.0.analog-stereo.monitor -f $HOME/Videos/Screen/$file &
	echo '' > /tmp/RECORDING
    fi
fi
pkill -RTMIN+8 waybar
