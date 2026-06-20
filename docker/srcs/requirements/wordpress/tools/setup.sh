#!/bin/bash

MYSQL_USER_PASSWORD=$(cat /run/secrets/db_password.txt)
WP_ADMIN_PASSWORD=$(cat /run/secrets/wp_root_password.txt)
WP_USER_PASSWORD=$(cat /run/secrets/wp_password.txt)
set -e
cd /var/www/html
# MYSQL_ROOT_PASSWORD = 
if [ ! -f wp-config.php ];then
while ! nc -z mariadb 3306;do
    sleep 1
done

wp core download --allow-root

wp config create --allow-root \
    --dbname=$MYSQL_DATABASE \
    --dbuser=$MYSQL_USER \
    --dbpass=$MYSQL_USER_PASSWORD \
    --dbhost=mariadb:3306 \
    --path="/var/www/html"
    
wp core install --allow-root \
    --url=$DOMAIN_NAME \
    --title="inception" \
    --admin_user=$WP_ADMIN_USER \
    --admin_password=$WP_ADMIN_PASSWORD \
    --admin_email=$WP_ADMIN_EMAIL 

wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root 

chown -R www-data:www-data /var/www/html

fi
exec php-fpm7.4 -F #force-foreground

# WP_USER_PASSWORD  and WP_ADMIN_PASSWORD
