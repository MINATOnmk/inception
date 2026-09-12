FROM debian:12

RUN apt-get update && apt-get -y install mariadb-server 

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY  tools/setup.sh /setup.sh 

RUN chmod +x /setup.sh

ENTRYPOINT ["/setup.sh"]
