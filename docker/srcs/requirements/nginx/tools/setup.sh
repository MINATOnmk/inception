#!/bin/bash
set -e
echo "1"
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/certif_key.key \
    -out /etc/nginx/certif.crt \
    -subj "/C=MA/ST=KH/L=Khouribga/O=1337/OU=mboulagh/CN=$DOMAIN_NAME"

echo "2"
exec nginx -g "daemon off;"