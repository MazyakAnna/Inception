#!/bin/sh

if ! [ -d /var/lib/mysql/wordpress]; then
	echo "LET'S CREATE THE WP DB"
	sed -i 's/bind-address            = 127.0.0.1/ bind-address            = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
	service mysqld start
	/usr/bin/mysql  < /tmp/create_db.sql;
fi
