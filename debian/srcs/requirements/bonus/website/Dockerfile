FROM debian:buster
RUN	apt-get update -y && apt-get upgrade -y
RUN	apt-get install -y nginx

RUN mkdir -p /var/www/html/mywebsite && \
    echo "server {" > /etc/nginx/sites-enabled/default && \
    echo "root    /var/www/html/mywebsite;" >> /etc/nginx/sites-enabled/default && \
    echo "location / {" >> /etc/nginx/sites-enabled/default && \
    echo "    try_files \$uri /index.html;" >> /etc/nginx/sites-enabled/default && \
    echo "}}" >> /etc/nginx/sites-enabled/default

COPY ./conf/index.html /var/www/html/mywebsite/index.html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
