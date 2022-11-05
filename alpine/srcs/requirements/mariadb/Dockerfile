FROM alpine:3.16

WORKDIR /app
VOLUME /app

RUN apk add --update mysql mysql-client && rm -f /var/cache/apk/*

# These lines moved to the end allow us to rebuild image quickly after only these files were modified.
COPY requirements/mariadb/conf/create_db.sh create_db.sh
COPY requirements/mariadb/conf/my.cnf /etc/mysql/my.cnf

EXPOSE 3306
CMD ["sh", "create_db.sh"]
