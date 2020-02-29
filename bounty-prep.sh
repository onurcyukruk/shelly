#!/usr/bin/env bash

# PS3='Please choose platform: '
# options=("hackerone" "bugcrowd" )
# select opt in "${options[@]}"
# do
#     case $opt in
#         "hackerone")
#             platname="hackerone"
# 	    break
#             ;;
#         "bugcrowd")
#             platname="bugcrowd"
# 	    break
#             ;;
#         *) echo "invalid option $REPLY";;
#     esac
# done

echo "Enter name of the program: "
read progname

# create directories
mkdir -p ~/dailywork/bounty/{skellfs,recon/$progname/{assets,amass,nmap}}

# copy and create some files
cp ~/dailywork/bounty/skellfs/amass* ~/dailywork/bounty/recon/$progname/amass/ &&
cp ~/dailywork/bounty/skellfs/root* ~/dailywork/bounty/recon/$progname/
