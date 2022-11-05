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

# https://wordpress.org/support/article/creating-database-for-wordpress/
if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then

        cat << EOF > /tmp/create_db.sql
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
CREATE DATABASE $MYSQL_DATABASE;
CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DARABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';;
FLUSH PRIVILEGES;
CREATE USER 'readonly_user'@'%' IDENTIFID BY '1';
GRANT SELECT, SHOW VIEW ON ${MYSQL_DATABASE}.* TO 'readonly_user'@'%' IDENTIFIED BY '1';
FLUSH PRIVILEGES;
EOF
        # run init.sql
        /usr/bin/mysqld --user=mysql --bootstrap < /tmp/create_db.sql
        rm -f /tmp/create_db.sql
fi
