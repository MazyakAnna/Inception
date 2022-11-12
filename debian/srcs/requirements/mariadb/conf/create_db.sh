#!/bin/sh

#if ! [ -d /var/lib/mysql/wordpress ]; then
	echo "LET'S CREATE THE WP DB"
	sed -i 's/bind-address            = 127.0.0.1/ bind-address            = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

	cat << EOF > /tmp/create_db.sql
USE mysql ;
FLUSH PRIVILEGES ;
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE_NAME;

GRANT ALL ON *.* TO 'root'@'%' identified by '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION ;
GRANT ALL ON *.* TO 'root'@'localhost' identified by '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION ;
SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${MYSQL_ROOT_PASSWORD}') ;
SET PASSWORD FOR 'root'@'%'=PASSWORD('${MYSQL_ROOT_PASSWORD}') ;

CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE_NAME.* TO '${MYSQL_USER}'@'localhost';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE_NAME.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES ;
EOF

#	chmod 777 /tmp/create_db.sql && service mysql start && mysql < /tmp/create_db.sql --verbose
#	rm -rf /tmp/create_db.sql ;
#fi
