# reference: https://wiki.alpinelinux.org/wiki/MariaDB
FROM alpine:3.16

RUN apk update; \
    apk upgrade; \
    apk add --no-cache mariadb mariadb-client mariadb-server-utils && \
    rm -rf /var/cache/apk/*

COPY requirements/mariadb/conf/create_db.sh /tmp/create_db.sh

RUN chmod -R 755 /tmp

EXPOSE 3306
#COPY requirements/mariadb/conf/db.sh db.sh
#RUN sh db.sh

ENTRYPOINT ["/tmp/create_db.sh"]
