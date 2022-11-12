# reference: https://wiki.alpinelinux.org/wiki/MariaDB
FROM debian:buster

ARG MYSQL_DATABASE_NAME \
    MYSQL_ROOT_PASSWORD \
    MYSQL_USER \
    MYSQL_PASSWORD \
    HOSTNAME

EXPOSE 3306

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install mariadb-server -y

COPY --chmod=777 ./conf/create_db.sh /tmp/create_db.sh

# setup server and create DB
RUN chmod 777 /tmp/create_db.sh && /tmp/create_db.sh && \
    chmod 777 /tmp/create_db.sql && \
	service mysql start && \
	mysql < /tmp/create_db.sql --verbose && \
	rm -rf /tmp/create_db.sql


# https://dev.mysql.com/doc/refman/8.0/en/mysqld-safe.html
ENTRYPOINT ["/usr/bin/mysqld_safe", "--skip-networking=0"]

# flags: https://mariadb.com/kb/en/server-system-variables/#skip_name_resolve
