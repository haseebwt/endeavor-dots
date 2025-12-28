#!/usr/bin/env bash

# Getting time
am_or_pm=$(date +%p)
time=$(($(date +%l)))

# Setting requirements
midnight=10
twelve_am=12
night=6

if [ "$am_or_pm" = "AM" ]; then

        if [ "$time" -lt "$midnight" ]; then
                wlsunset -t 5900 -T 7000

        # Settup up special condition for 12 AM
        elif [ "$time" = "$twelve_am" ]; then
                wlsunset -t 5900 -T 7000
        fi

elif [[ "$am_or_pm" = "PM" ]]; then

       if [ "$time" -gt "$night" ]; then
               wlsunset -t 5900 -T 7000
       fi
fi
