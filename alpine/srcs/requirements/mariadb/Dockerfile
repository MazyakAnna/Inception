from alpine:3.16

RUN apk update && apk upgrade && apk add mysql mysql-client

EXPOSE 3306
#COPY requirements/mariadb/conf/db.sh db.sh
#RUN sh db.sh
#ENTRYPOINT ["mysqld"]
CMD sh
