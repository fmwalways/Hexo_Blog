#!/usr/bin/env sh
echo($1)
echo($SSH_HOST)
ssh $1@$2:$3
cd /home/blog/public/
git fetch --all && git reset --hard origin/master && git pull
