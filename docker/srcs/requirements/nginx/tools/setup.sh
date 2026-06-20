#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/certif_key.key; \
    -out /etc/nginx/certif.crt \
    -subj "/C=MA/ST=KH/L=Khouribga/O=1337/OU=mboulagh/CN=mboulagh.42.fr" \

exec nginx -g "daemon off;"