FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y nginx
COPY tools/cert/* /etc/ssl/
COPY conf/nginx.conf /etc/nginx/sites-enabled/mynginx.conf
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
