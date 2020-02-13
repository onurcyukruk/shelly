#!/usr/bin/env bash
cd ~/gelgit/todos/ && git add --all && git commit -m "todos-dones-backup-`date`" && git push origin master
