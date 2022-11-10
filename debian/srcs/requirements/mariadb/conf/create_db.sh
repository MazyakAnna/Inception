#!/bin/sh

echo "Check mysqld dir"
if [ -d "/run/mysqld" ]; then
	chown -R mysql:mysql /run/mysqld
else
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

echo "Check dir with initial DBs"
if [ -d /var/lib/mysql/mysql ]; then
	chown -R mysql:mysql /var/lib/mysql
	echo "WE DO ALREADY HAVE SMTH"
else
	chown -R mysql:mysql /var/lib/mysql
	mysql_install_db --user=mysql --ldata=/var/lib/mysql > /dev/null
fi

if ! [ -d /var/lib/mysql/wordpress]; then
	echo "LET'S CREATE THE WP DB"
	sed -i 's/bind-address            = 127.0.0.1/ bind-address            = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
	/usr/bin/mysqld --user=mysql --bootstrap --verbose=0 --skip-name-resolve --skip-networking=0  < /tmp/create_db.sql
fi
