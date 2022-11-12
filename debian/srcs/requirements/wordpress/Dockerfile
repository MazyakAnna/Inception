# https://wordpress.org/support/article/how-to-install-wordpress/
# https://wordpress.org/support/article/creating-database-for-wordpress/#using-the-mysql-client
# https://wp-cli.org/
# https://developer.wordpress.org/cli/commands/

FROM debian:buster

EXPOSE 9000

RUN apt-get update && apt-get install -y \
    php7.3 \
    php-fpm \
    php-mysqli \
    php-json \
    php-curl \
    php-xml \
    php-zip \
    mariadb-client \
    php-redis \
    php-phar \
    curl && \
    rm -f /var/cache/apk/* && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    # php wp-cli.phar --info
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp && \
    mkdir -p /var/log/php-fpm && mkdir -m 777 -p /var/www/html/wordpress && \
    wp core download --path='/var/www/html/wordpress' --allow-root

COPY ./tools/create_wpsite.sh /tmp/tools/create_wpsite.sh
COPY ./conf/* /tmp/conf/

RUN sed -i "s|listen = /run/php/php7.3-fpm.sock|listen = 9000|g" /etc/php/7.3/fpm/pool.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" /etc/php/7.3/fpm/pool.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" /etc/php/7.3/fpm/pool.d/www.conf
    # sed -i "s|;daemonize = yes|daemonize = no|g" /etc/php/7.3/fpm/pool.d/www.conf && \


WORKDIR /var/www/html/
ENTRYPOINT  ["sh", "/tmp/tools/create_wpsite.sh"]
