FROM debian:12

RUN apt-get update && apt-get install -y \
    php8.2-fpm \
    php8.2-mysql \
    curl

RUN sed -i 's|listen = /run/php/php8.2-fpm.sock|listen = 9000|g' /etc/php/8.2/fpm/pool.d/www.conf

RUN mkdir -p /run/php \
    && chown -R www-data:www-data /run/php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp


COPY tools/init_wp.sh /usr/local/bin/init_wp.sh
RUN chmod +x /usr/local/bin/init_wp.sh

ENTRYPOINT ["init_wp.sh"]
