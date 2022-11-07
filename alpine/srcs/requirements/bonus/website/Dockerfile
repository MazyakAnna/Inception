FROM alpine:3.16
RUN	apk update && apk upgrade && apk add --no-cache nginx

RUN mkdir -p /var/www/html/mywebsite && \
    echo "server {" > /etc/nginx/http.d/default.conf && \
    echo "root    /var/www/html/mywebsite;" >> /etc/nginx/http.d/default.conf && \
    echo "location / {" >> /etc/nginx/http.d/default.conf && \
    echo "    try_files \$uri /index.html;" >> /etc/nginx/http.d/default.conf && \
    echo "}}" >> /etc/nginx/http.d/default.conf

COPY requirements/bonus/website/conf/index.html /var/www/html/mywebsite/index.html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
