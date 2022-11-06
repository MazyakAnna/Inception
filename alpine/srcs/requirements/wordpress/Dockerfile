# https://wordpress.org/support/article/how-to-install-wordpress/
# https://wiki.alpinelinux.org/wiki/WordPress
# https://wordpress.org/support/article/creating-database-for-wordpress/#using-the-mysql-client
# https://wp-cli.org/
# https://developer.wordpress.org/cli/commands/
# https://developer.wordpress.org/cli/commands/config/create/

FROM alpine:3.16

ARG WORDPRESS_DB_HOST \
    WORDPRESS_DB_NAME \
    WORDPRESS_DB_USER \
    WORDPRESS_DB_PASSWORD \
    WORDPRESS_TABLE_PREFIX \
    DOMAIN_NAME \
    WORDPRESS_TITLE \
    WORDPRESS_ADMIN_USER \
    WORDPRESS_ADMIN_PASSWORD \
    REDIS_PASSWORD \
    REDIS_HOST

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
    mariadb-client \
    php8-redis \
    php8-phar \
    curl && \
    rm -f /var/cache/apk/* && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    # php wp-cli.phar --info
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp && \
    wp core download  --allow-root && \
    mkdir -p /var/log/php-fpm
    RUN sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php8/php-fpm.d/www.conf && \
        sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" /etc/php8/php-fpm.d/www.conf && \
        sed -i "s|;listen.group = nobody|listen.group = nobody|g" /etc/php8/php-fpm.d/www.conf
        # sed -i "s|;daemonize = yes|daemonize = no|g" /etc/php8/php-fpm.conf && \
    COPY ./tools/create_wpsite.sh /tmp/tools/create_wpsite.sh
    COPY ./conf/* /tmp/conf/
    # RUN cp /tmp/conf/php-fpm.conf /etc/php8/php-fpm.conf && \
    # RUN cp /tmp/conf/www.conf /etc/php8/php-fpm.d/www.conf

WORKDIR /var/www/html/


CMD    ["sh", "/tmp/tools/create_wpsite.sh"]

#   -F flag = no demonize
# ENTRYPOINT ["/usr/sbin/php-fpm8", "-F"]