FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php7.4 \
    php7.4-fpm \
    php7.4-mysql \
    curl \
    mariadb-client \


COPY conf/www.conf   /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /run/php \
    && chown -R www-data:www-data /run/php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

COPY tools/init_wp.sh /usr/local/bin/init_wp.sh
RUN chmod +x /usr/local/bin/init_wp.sh

CMD ["init_wp.sh"]

