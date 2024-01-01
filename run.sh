#!/bin/sh

mkdir /tmp/.ssh
echo "${LITESTREAM_SSH_PRIVKEY}"|base64 -d > /tmp/.ssh/id_rsa

echo "trying to restore the database (if it exists)..."
litestream restore -if-replica-exists  /app/data/kuma.db

echo "starting replication and the application..."
litestream replicate
