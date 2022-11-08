# man: https://wiki.alpinelinux.org/wiki/PhpMyAdmin
FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y

ARG PMA_HOST

RUN apt-get install -y \
    php7.3 \
    php-common \
    php-session \
    php-iconv \
    php-gd \
    php-curl \
    php-xml \
    php-mysqli \
    php-imap \
    php-cgi \
    php-pdo \
    php-pdo_mysql \
    php-soap \
    php-posix \
    php-gettext \
    php-ldap \
    php-ctype \
    php-dom \
    php-simplexml \
    wget

WORKDIR /var/www/html

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz && \
    tar -xvf phpMyAdmin-5.0.4-all-languages.tar.gz && \
    mv phpMyAdmin-5.0.4-all-languages phpmyadmin && chown -R 777 /var/www && \
    rm "phpMyAdmin-5.0.4-all-languages.tar.gz" && \
    cp "/var/www/html/phpmyadmin/config.sample.inc.php" "/var/www/html/phpmyadmin/config.inc.php" && \
    sed -i "s|localhost|$PMA_HOST|g" /var/www/html/phpmyadmin/config.inc.php

EXPOSE 8080

# starting webserver from all to 8080 port with a specific root directory
ENTRYPOINT [ "php", "-S", "[::]:8080", "-t", "/var/www/html/phpmyadmin" ]
