#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/certif_key.key \
    -out /etc/nginx/certif.crt \
    -subj "/CN=$DOMAIN_NAME"

exec nginx -g "daemon off;"