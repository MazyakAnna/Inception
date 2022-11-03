#!bin/sh

if [ ! -d "/var/lib/mysql/mysql" ]; then

        chown -R mysql:mysql /var/lib/mysql

        # mysql_install_db initializes the MySQL data directory 
	#     and creates the system tables that it contains, if they do not exist
	# --user: user that mysqld (mysql server) runs as
	# --basedir: installation dir; --datadir: data dir;
        mysql_install_db --user=mysql \
		--basedir=/usr \
		--datadir=/var/lib/mysql \

        tfile=`mktemp`
        if [ ! -f "$tfile" ]; then
                return 1
        fi
fi

if [ ! -d "/var/lib/mysql/$WP_DB_NAME" ]; then

        cat << EOF > /tmp/create_db.sql
FLUSH PRIVILEGES;
CREATE DATABASE ${WP_DB_NAME};
FLUSH PRIVILEGES;
CREATE USER '${DB_ADMIN}'@'localhost' IDENTIFIED BY '${DB_ROOT_PWD}';
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO '${DB_ADMIN}'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
CREATE USER '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PWD}';
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
-- ALTER USER 'root'@'localhost' IDENTIFIED BY '{DB_ROOT_PWD}';
-- FLUSH PRIVILEGES;
EOF
        # run init.sql
        /usr/bin/mysqld --user=mysql --bootstrap < /tmp/create_db.sql
        rm -f /tmp/create_db.sql
fi
