FROM debian:12

RUN apt-get update && apt install -y curl php php-mysql
WORKDIR /var/www/html
RUN curl -Lo index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
CMD ["php", "-S", "0.0.0.0:8080"]