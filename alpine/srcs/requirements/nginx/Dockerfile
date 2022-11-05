FROM alpine:3.16

RUN apk update && apk upgrade && apk add --no-cache nginx
EXPOSE 443
COPY ./tools/cert/* /etc/ssl/
COPY ./conf/nginx.conf /etc/nginx/http.d/nginx.conf
#COPY requirements/nginx/tools/index.html /var/www/index.php
CMD ["nginx", "-g", "daemon off;"]
