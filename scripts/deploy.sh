#!/bin/sh
ssh $SSH_USER@$SSH_HOST:&SSH_PORT
cd /home/blog/public/
git fetch --all && git reset --hard origin/master && git pull
