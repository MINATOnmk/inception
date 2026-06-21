#!/bin/bash

echo "variable  is $MYSQL_USER_PASSWORD - $WP_ADMIN_PASSWORD - $WP_USER_PASSWORD  - $MYSQL_USER - $MYSQL_DATABASE -$DOMAIN_NAME -$WP_ADMIN_PASSWORD"

set -e


cd /var/www/html

if [ ! -f wp-config.php ]; then

    echo "1"

    while ! mysqladmin ping -h"mariadb" --silent; do
        echo "MariaDB not ready yet, waiting..."
        sleep 2
    done

    echo "2"

    if [ ! -f wp-settings.php ]; then
        wp core download --allow-root
    fi

    echo "3"

    wp config create --allow-root \
        --dbname=$MYSQL_DATABASE \
        --dbuser=$MYSQL_USER \
        --dbpass=$MYSQL_USER_PASSWORD \
        --dbhost=mariadb

    echo "4"

    wp core install --allow-root \
        --url=$DOMAIN_NAME \
        --title="inception" \
        --admin_user=$WP_ADMIN_USER \
        --admin_password=$WP_ADMIN_PASSWORD \
        --admin_email=$WP_ADMIN_EMAIL 

    echo "5"

    wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root 

    echo "6"

    # ls -l  /var/www/html
    chown -R www-data:www-data /var/www/html
    
else 
    echo "the files of wordpress already exist"
fi

echo "=> Starting PHP-FPM daemon..."

exec php-fpm7.4 -F #force-foreground
