# https://wordpress.org/support/article/how-to-install-wordpress/
# https://wiki.alpinelinux.org/wiki/WordPress

FROM alpine:3.16

# ARG WORDPRESS_DB_HOST \
#     WORDPRESS_DB_NAME \
#     WORDPRESS_DB_USER \
#     WORDPRESS_DB_PASSWORD \
#     WORDPRESS_TABLE_PREFIX \
#     DOMAIN_NAME

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
    mkdir -p /var/www/html/wordpress && \
    rm -f /var/cache/apk/*

WORKDIR /var/www/html

RUN mkdir tmp && wget https://wordpress.org/latest.zip && \
    unzip latest.zip -d ./tmp && \
    cp -rf tmp/wordpress/* wordpress/* . && \
    chmod 777 wordpress/ && \
    rm -rf tmp

EXPOSE 9000

# https://wordpress.org/support/article/creating-database-for-wordpress/#using-the-mysql-client

COPY ./conf/add_wp-config.sh add_wp-config.sh

RUN sh add_wp-config.sh && rm add_wp-config.sh
RUN chmod -R 0777 /var/www/html/wordpress/wp-content/
# RUN chmod +x /usr/local/bin/wp

#-F flag == no demonize
CMD ["/usr/sbin/php-fpm8", "-F"]
