#!/usr/bin/env bash
# Originally by Gonka79. I made my some modifications
#Github : Gonka79

# Assigning the wifi interface
interface="wlan0"
# config="-config $HOME/.config/rofi/networks.rasi"

# Listing the networks with all fancy shmancy 
list_networks() {
    nmcli -t -f SSID,SECURITY dev wifi list ifname $interface | awk -F: '!seen[$1]++{print "🛜 " $1 " - " $2}'
}

# Loading 
known_networks() {
    # nmcli -t -f NAME connection show
    cat $HOME/.config/scripts/networks.txt
}

# Loading the networks in rofi 
choose_network() {
    networks=$(list_networks)
    chosen_network=$(echo -e "$networks" | rofi -dmenu  -p "Wi-Fi Networks") 
    
    # If a network is chosen
    if [ "$chosen_network" ]; then

	# assigning the network to a variable
        ssid=$(echo "$chosen_network" | awk -F' - ' '{print $1}' | sed 's/🛜 //')

	# check if it already exists, if it does don't ask for password
	known=$(known_networks)
	if [[ $known == *$ssid* ]]; then

            nmcli dev wifi connect "$ssid" ifname $interface
	    rofi -theme-str 'window {height: 10%; width: 32%;}' -e "Connected to $ssid successfully!"

	else
	    # asking for password 
	    security=$(echo "$chosen_network" | awk -F' - ' '{print $2}')
	    if [ "$security" != "--" ]; then

		# we put the password in a variable and try to connect 
		pass=$(rofi -dmenu  -p "Enter Pwd")
		nmcli dev wifi connect "$ssid" password "$pass" ifname $interface

		# If connects, then prints succes. Otherwise, prompt error! 
		if [ $? -eq 0 ]; then
		    rofi -theme-str 'window {height: 10%; width: 32%;}' -e "Connected to $ssid successfully!"
		    sleep 1; echo $ssid >> $HOME/.config/scripts/networks.txt
		else
		    rofi -theme-str 'window {height: 10%; width: 32%;}' -e "Error connecting to $ssid. Incorrect password, maybe?"
		fi
	    fi
        fi
    fi
}

# Start
choose_network
