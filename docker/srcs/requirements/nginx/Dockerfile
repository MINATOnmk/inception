FROM debian:bullseye

RUN apt-get update && apt-get install  nginx openssl -y

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

COPY tools/setup.sh /setup.sh

RUN chmod +x /setup.sh

EXPOSE 443

ENTRYPOINT ["/setup.sh"]
