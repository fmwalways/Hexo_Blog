#!/usr/bin/env sh
echo($SSH_HOST)
echo $1
ssh $1@$2:$3
cd /home/blog/public/
git fetch --all && git reset --hard origin/master && git pull
