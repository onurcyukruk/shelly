#!/usr/bin/env bash
# send file contents to termbin.com
# put termbin link to clipboard
# usage: ~/termbin.sh file.txt
cat $1 | nc termbin.com 9999 | xclip

