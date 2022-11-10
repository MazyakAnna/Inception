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

COPY ./conf/create_db.* /tmp/

#RUN sh /tmp/create_db.sh
ENTRYPOINT tail -f
#ENTRYPOINT ["mysqld"]
#CMD ["--user=mysql", "--skip-name-resolve", "--skip-networking=0"]

# flags: https://mariadb.com/kb/en/server-system-variables/#skip_name_resolve
