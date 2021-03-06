#!/bin/sh

CONFIG_DIR=config
PEM_FILENAME=$CONFIG_DIR/passkey.pem

if [ ! -f $PEM_FILENAME ]
then
  openssl genpkey -out $PEM_FILENAME -outform PEM -algorithm RSA -pkeyopt rsa_keygen_bits:2048
fi

if [ ! -z $PREFIX ]
then
  ip route add local $PREFIX dev lo
fi

exec node app.js $@
