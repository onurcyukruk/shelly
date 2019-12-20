#!/usr/bin/env bash
# prep script for hackthebox machines creates directories, searches and replaces
# ip address/name of of the box in common commands used in recon etc.
echo "Enter name of the box to solve:"
read boxname
echo "Enter ip address of the $boxname:"
read ipaddress

# create directories
mkdir -p ~/hackthebox/$boxname/{wordlist,nmap,exploits,downloads,uploads} &&

# create file for taking notes
touch ~/hackthebox/$boxname/$boxname.org &&

# copy some files
cp ~/hackthebox/commands.txt ~/hackthebox/$boxname/ &&

# search and replace assoc array
declare -A srarray
srarray=(
    [%%BOX_NAME%%]=$boxname
    [%%IP_ADDRESS%%]=$ipaddress
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
echo "$ipaddress $boxname" | sudo tee -a /etc/hosts

