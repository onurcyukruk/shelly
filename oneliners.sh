#!/usr/bin/env bash

# nmap full port scan
sudo nmap -sS -p- host

# cleanup illegal ip addresses from addresses.txt
grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' addresses.txt

####################################################################
#SUBDOMAIN TAKEOVER
# https://twitter.com/hahwul/status/1228364474282733568
subfinder -d {target} >> domains
assetfinder -subs-only {target} >> domains
amass enum -norecursive -noalts -d {target} >> domains
subjack -w domains -t 100 -timeout 30 -ssl -c ~/HAHWUL/tool/subjack/fingerprints.json -v 3 >> takeover

# second, make http/https urls and get response data
cat domains | httprobe | tee hosts ; meg -d 1000 -v 

#third, find your testing poing from grep/gf , etc...
gf cors
gf s3-buckets
grep "sessions=" * -R
etc...

####################################################################

# amass passive resources get domains
amass enum --passive -d target.com > subdoms.txt

# amass 
amass enum -src -ipv4 -config conf.ini


# clean dns resolvers
cat amass.log | grep "returned false" | cut -d " " -f 4 > failedres.txt
cat amass.log | grep "failed to resolve" | cut -d " " -f 4 >> failedres.txt 
grep -v -x -f failedres.txt amass-resolvers.txt > clean-dnss.txt
rm amass-resolvers.txt && mv clean-dnss.txt amass-resolvers.txt


# pulltoloc.sh
rsync -a onur@remkbox:/home/onur/dailywork /home/onur/bounty/recon/amass/
rsync -a onur@remkbox:/home/onur/dailywork/bounty/recon/abnamro/amass/amass.log /home/onur/dailywork/bounty/recon/abnamro/amass/

# pushtorem.sh
rsync -a /home/onur/dailywork onur@remkbox:/home/onur/
rsync -a -v -e ssh /home/onur/dailywork onur@remkbox:/home/onur/
rsync -a -v -e ssh /home/onur/gelgit/shelly onur@remkbox:/home/onur/

# get subs from amass.log
cat amass.json | jq -r ".name" > subs-active.txt
