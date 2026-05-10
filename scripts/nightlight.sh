#!/usr/bin/env bash

# Getting time
time=$(($(date +%H)))

# Setting requirements
morning=8
night=18

if [[ "$time" -gt "$night" || "$time" -lt "$morning" ]]; then

        wlsunset -t 5000 -T 7000
fi
