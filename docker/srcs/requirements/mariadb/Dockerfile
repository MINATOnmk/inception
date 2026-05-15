FROM debian:bullseye

RUN apt-get update && apt-get -y install mariadb-server

# RUN mkdir -p /run/mysqld && chwon mysqld:mysqld /run/mysqld 

RUN  sed "i/127.0.0.1/0.0.0.0/g" 

COPY requirements/mariadb/tools/setup.sh /setup.sh

EXPOSE 3306

