FROM debian:12

RUN apt-get update && apt-get install nginx -y

COPY tools/index.html /var/www/html/index.html

CMD ["nginx" , "-g" ,"daemon off;"]