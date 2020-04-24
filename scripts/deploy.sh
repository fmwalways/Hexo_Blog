ssh $1@$2:$3
cd /home/blog/public/
git fetch --all && git reset --hard origin/master && git pull
