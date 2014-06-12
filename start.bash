#! /bin/bash

mkdir -p /var/redis
mkdir -p /var/uploads
mkdir -p /var/dumpFolder
mkdir -p /var/compiles
mkdir -p /var/cache
mkdir -p /var/user_files

mkdir -p /var/log/mongodb
mkdir -p /var/lib/mongodb

mongod --bind_ip=127.0.0.1 --dbpath=/var/lib/mongodb --logpath=/var/log/mongodb/mongod.log --logappend --fork

echo "started mongo"

redis-server /etc/redis.conf &

echo "started redis"

grunt run
