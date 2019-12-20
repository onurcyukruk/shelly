#!/usr/bin/env bash
# prep & organization script for hackthebox machines. Creates directories, searches and replaces
# ip address/name of of the box in common commands used in recon etc.
echo "Enter name of the box to solve:"
read boxname
echo "Enter ip address of the boxname:"
read boxipad

# create directories
mkdir -p ~/hackthebox/$boxname/{wordlist,nmap,exploits,downloads,uploads} &&

# create file for taking notes
touch ~/hackthebox/$boxname/$boxname.org &&

# copy some files
cp ~/hackthebox/commands.txt ~/hackthebox/$boxname/ &&

# 

# search and replace array
declare -A srarray
srarray=(
    [%%BOX_NAME%%]=$boxname
    [%%BOX_IPAD%%]=$boxipad
    [%%LOCAL_IP%%]=$(ifconfig | grep -A 1 'tun0' | tail -1 | awk '{$1=$1;print}' | cut -d " " -f 2)
)

# search and replace loop
sr() {
    # Loop the config array
    for i in "${!srarray[@]}"
    do
        search=${i}
        replace=${srarray[$i]}
        sed -i "s/${search}/${replace}/g" ~/hackthebox/$boxname/commands.txt
    done
}
sr &&

# hosts file add ipaddress and boxname
echo "$boxipad $boxname" | sudo tee -a /etc/hosts

