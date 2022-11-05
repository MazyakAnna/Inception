# reference: https://wiki.alpinelinux.org/wiki/MariaDB
FROM alpine:3.16

ARG MYSQL_DATABASE \
    MYSQL_ROOT_PASSWORD \
    MYSQL_USER \
    MYSQL_PASSWORD \
    HOSTNAME

COPY requirements/mariadb/conf/create_db.sh /tmp/create_db.sh

RUN apk update; \
    apk upgrade; \
    apk add --no-cache mariadb mariadb-client mariadb-server-utils && \
    rm -rf /var/cache/apk/* && chmod -R 755 /tmp/create_db.sh

EXPOSE 3306
#COPY requirements/mariadb/conf/db.sh db.sh
#RUN sh db.sh

RUN sh /tmp/create_db.sh
ENTRYPOINT ["/usr/bin/mysqld", "--user=mysql",  "--console", "--skip-name-resolve", "--skip-networking=0"]

