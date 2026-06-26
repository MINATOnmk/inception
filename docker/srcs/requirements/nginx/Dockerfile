FROM debian:12

RUN apt-get update && apt-get install nginx openssl -y

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

COPY tools/setup.sh /setup.sh

RUN chmod +x /setup.sh



ENTRYPOINT ["/setup.sh"]
