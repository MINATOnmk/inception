#!/bin/bash


if [ ! -d "/var/lib/mysql/mysql" ]; then
mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null 2>&1
fi

mysqld_safe --skip-networking &
MYSQL_PID=$!

while ! nc -z localhost 3306; do   
  sleep 1
done

mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

mysql -u root -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%'IDENTIFIED BY '${MYSQL_PASSWORD}';"

mysql -u root -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%';"

mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

mysql -u root -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown

wait $MYSQL_PID

exec mysqld_safe