# reference: https://wiki.alpinelinux.org/wiki/MariaDB
FROM debian:buster

ARG MYSQL_DATABASE \
    MYSQL_ROOT_PASSWORD \
    MYSQL_USER \
    MYSQL_PASSWORD \
    HOSTNAME

EXPOSE 3306

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install mariadb-server -y

COPY ./conf/create_db.sql /tmp/

# setup server and create DB
RUN	sed -i 's/bind-address            = 127.0.0.1/ bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf && \
#	(echo "cat << EOF ; cat /tmp/create_db.sql ; echo EOF ) > /tmp/tmp_file.sql && \
	service mysql start; \ 
	cat /tmp/create_db.sql | mysql 

# https://dev.mysql.com/doc/refman/8.0/en/mysqld-safe.html
ENTRYPOINT ["/usr/bin/mysqld_safe", "--skip-networking=0"]
#CMD ["--skip-name-resolve", "--skip-networking=0"]

# flags: https://mariadb.com/kb/en/server-system-variables/#skip_name_resolve
