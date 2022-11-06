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


# RUN apk update && apk upgrade && apk add --no-cache \
#     php8 \
#     php8-fpm \
#     php8-mysqli \
#     php8-json \
#     php8-curl \
#     php8-dom \
#     php8-exif \
#     php8-fileinfo \
#     php8-mbstring \
#     php8-openssl \
#     php8-xml \
#     php8-zip \
#     php8-redis \
#     curl && \
#     # sed -i "s|;daemonize = yes|daemonize = no|g" /etc/php8/php-fpm.conf && \
#     rm -f /var/cache/apk/*
#     RUN    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN			apk update && apk upgrade && apk add --no-cache		\
											php7				\
											php7-fpm			\
											php7-phar			\
											php7-json			\
											php7-mysqli			\
											php7-curl			\
											php7-iconv			\
											php7-pecl-mailparse	\
											curl				\
											mariadb-client		\
											bash				\
											wget				\
											curl				\
											vim					\
											sudo

RUN			curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
			chmod +x wp-cli.phar &&	\
			cp wp-cli.phar /usr/bin/wp 


    RUN php wp-cli.phar --info
    RUN chmod +x wp-cli.phar && sudo mv wp-cli.phar /usr/local/bin/wp
    RUN wp core download
    # RUN ls /var/www/html/
    RUN mkdir -p /var/log/php-fpm
    RUN     sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php8/php-fpm.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" /etc/php8/php-fpm.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" /etc/php8/php-fpm.d/www.conf && \
    COPY ./tools/* /tmp/tools/
    COPY ./conf/* /tmp/conf/
    RUN cp /tmp/conf/php-fpm.conf /etc/php7/php-fpm.conf && \
    cp /tmp/conf/www.conf /etc/php7/php-fpm.d/www.conf && \
    cp 

WORKDIR /var/www/html/


# RUN sh /tmp/conf/add_wp-config.sh && \
#     rm /tmp/conf/add_wp-config.sh && \
#     chmod -R 777 wordpress/wp-content/ && \
RUN    sh /tmp/tools/create_wpsite.sh

#   -F flag = no demonize
ENTRYPOINT ["/usr/sbin/php-fpm8", "-F"]