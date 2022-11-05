# https://wordpress.org/support/article/how-to-install-wordpress/
# https://wiki.alpinelinux.org/wiki/WordPress
# https://wordpress.org/support/article/creating-database-for-wordpress/#using-the-mysql-client

FROM alpine:3.16

ARG WORDPRESS_DB_HOST \
    WORDPRESS_DB_NAME \
    WORDPRESS_DB_USER \
    WORDPRESS_DB_PASSWORD \
    WORDPRESS_TABLE_PREFIX \
    DOMAIN_NAME \
    WORDPRESS_TITLE \
    WORDPRESS_ADMIN_USER \
    WORDPRESS_ADMIN_PASSWORD

EXPOSE 9000

RUN apk update && apk upgrade && apk add --no-cache \
    php8 \
    php8-fpm \
    php8-mysqli \
    php8-json \
    php8-curl \
    php8-dom \
    php8-exif \
    php8-fileinfo \
    php8-mbstring \
    php8-openssl \
    php8-xml \
    php8-zip \
    php8-redis \
    wget \
    unzip && \
    sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php8/php-fpm.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" /etc/php8/php-fpm.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" /etc/php8/php-fpm.d/www.conf && \
    # sed -i "s|;daemonize = yes|daemonize = no|g" /etc/php8/php-fpm.conf && \
    rm -f /var/cache/apk/*

WORKDIR /var/www/html/

RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    chmod 777 wordpress/ && \
    rm -rf latest.zip

COPY ./conf/add_wp-config.sh add_wp-config.sh

RUN sh add_wp-config.sh && \
    rm add_wp-config.sh && \
    chmod -R 777 wordpress/wp-content/

#   -F flag = no demonize
CMD ["/usr/sbin/php-fpm8", "-F"]
