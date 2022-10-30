FROM debian:buster

RUN apt update -y

RUN apt -y install nginx

EXPOSE 80 423

COPY ./tools/nginx.conf /usr/local/etc/nginx

ENTRYPOINT

