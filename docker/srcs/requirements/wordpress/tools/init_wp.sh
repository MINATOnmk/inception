#!/bin/bash

cd /var/www/html

if [ ! -f wp-config.php ]; then

    sleep 10
    
    wp core download --allow-root

    wp config create --allow-root \
        --dbname=$MYSQL_DATABASE \
        --dbuser=$MYSQL_USER \
        --dbpass=$MYSQL_USER_PASSWORD \
        --dbhost=mariadb

    wp core install --allow-root \
        --url=$DOMAIN_NAME \
        --title="inception" \
        --admin_user=$WP_ADMIN_USER \
        --admin_password=$WP_ADMIN_PASSWORD \
        --admin_email=$WP_ADMIN_EMAIL 

    wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root 

    chown -R www-data:www-data /var/www/html
    
    wp plugin install redis-cache --activate --allow-root # bonus

    wp config set WP_REDIS_HOST redis --allow-root # bonus

    wp redis enable --allow-root # bonus 

fi

exec php-fpm8.2 -F 
