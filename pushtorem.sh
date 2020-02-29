#!/usr/bin/env bash
rsync -a /home/onur/dailywork onur@remkbox:/home/onur/
rsync -a -v -e ssh /home/onur/dailywork onur@remkbox:/home/onur/
rsync -a -v -e ssh /home/onur/gelgit/shelly onur@remkbox:/home/onur/
