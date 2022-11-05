# reference: https://wiki.alpinelinux.org/wiki/MariaDB
FROM alpine:3.16

ARG MYSQL_DATABASE \
    MYSQL_ROOT_PASSWORD \
    MYSQL_USER \
    MYSQL_PASSWORD \
    HOSTNAME

EXPOSE 3306

RUN apk update; \
    apk upgrade; \
    apk add --no-cache mariadb mariadb-client mariadb-server-utils && \
    rm -rf /var/cache/apk/*

COPY requirements/mariadb/conf/create_db.sh /tmp/create_db.sh

RUN chmod -R 755 /tmp/create_db.sh && sh /tmp/create_db.sh

ENTRYPOINT ["/usr/bin/mysqld"]
CMD ["--user=mysql",  "--console", "--skip-name-resolve", "--skip-networking=0"]
