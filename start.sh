mkdir -p /var/lib/texmf
mkdir -p /var/redis
mkdir -p /var/uploads
mkdir -p /var/dumpFolder
mkdir -p /var/compiles
mkdir -p /var/cache
mkdir -p /var/user_files

mkdir -p /var/log/mongodb
mkdir -p /var/lib/mongodb

export SESSION_SECRET=`base64 /dev/urandom | head -c 30`
export NODE_ENV=production

mongod --bind_ip=127.0.0.1 --dbpath=/var/lib/mongodb --logpath=/var/log/mongodb/mongod.log --logappend --fork

echo "started mongo"

redis-server /etc/redis.conf &

echo "started redis"

node document-updater/app.js &

echo "started document updater"

node web/app.js




