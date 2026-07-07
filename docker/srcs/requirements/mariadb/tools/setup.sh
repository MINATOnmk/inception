#!/bin/bash

# set -e

# echo "1"
# echo "Variables are: DB=$MYSQL_DATABASE, USER=$MYSQL_USER, PASS=$MYSQL_USER_PASSWORD"

# if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
#     echo "=> Installing DB for the first time..."
#     mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null 

#     echo "2"
#     mysqld_safe --skip-networking &
#     MYSQL_PID=$!
    
#     sleep 10

#     echo "3"
#     mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

#     mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_USER_PASSWORD}';"

#     mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%';"

#     mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

#     mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"
#     echo "4"
#     mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown
#     echo "4.5"
#     wait $MYSQL_PID
# fi
#     echo "5"
# exec mysqld_safe

set -e

echo "1"
    
    mysqld --user=mysql --bootstrap << EOF
        FLUSH PRIVILEGES; 
        CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
        CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_USER_PASSWORD}';
        GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%';
        ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
EOF

exec mysqld --user=mysql
