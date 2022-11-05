# reference: https://wiki.alpinelinux.org/wiki/MariaDB
FROM alpine:3.16

RUN apk update; \
    apk upgrade; \
    apk add --no-cache mariadb mariadb-client mariadb-server-utils && \
    rm -f /var/cache/apk/*

COPY requirements/mariadb/conf/create_db.sh /scripts/run.sh

RUN mkdir /docker-entrypoint-initdb.d && \
    mkdir /scripts/pre-exec.d && \
    mkdir /scripts/pre-init.d && \
    chmod -R 755 /scripts

EXPOSE 3306
#COPY requirements/mariadb/conf/db.sh db.sh
#RUN sh db.sh

ENTRYPOINT ["/scripts/run.sh"]
