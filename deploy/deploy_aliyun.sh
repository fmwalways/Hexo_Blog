#!/usr/bin/env sh
ssh -p $SSH_ALI_PORT $SSH_ALI_USER@$SSH_ALI_HOST "cd /home/blog/; git fetch --all && git reset --hard origin/master && git pull"
