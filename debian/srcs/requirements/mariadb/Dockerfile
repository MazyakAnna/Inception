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

COPY requirements/mariadb/conf/create_db.sh /tmp/create_db.sh

RUN chmod -R 755 /tmp/create_db.sh && sh /tmp/create_db.sh


ENTRYPOINT ["mysqld"]
CMD ["--user=mysql", "--skip-name-resolve", "--skip-networking=0"]

# flags: https://mariadb.com/kb/en/server-system-variables/#skip_name_resolve
