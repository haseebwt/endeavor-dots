#!/usr/bin/env bash

get_updates(){
    pacman -Sy
    pacman -Qu > /tmp/upgradable.txt
    list=$(wc -l < /tmp/upgradable.txt)
    number
}

number(){
    echo $list 
}

get_updates
