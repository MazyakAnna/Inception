# man: https://wiki.alpinelinux.org/wiki/PhpMyAdmin
FROM alpine:3.16

ARG PMA_HOST

RUN apk update && apk upgrade && apk add --no-cache \
    php8 \
    php8-common \
    php8-session \
    php8-iconv \
    php8-gd \
    php8-curl \
    php8-xml \
    php8-mysqli \
    php8-imap \
    php8-cgi \
    php8-pdo \
    php8-pdo_mysql \
    php8-soap \
    php8-posix \
    php8-gettext \
    php8-ldap \
    php8-ctype \
    php8-dom \
    php8-simplexml \
    wget

WORKDIR /var/www/html

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz && \
    tar -xvf phpMyAdmin-5.0.4-all-languages.tar.gz && \
    mv phpMyAdmin-5.0.4-all-languages phpmyadmin && chown -R 777 /var/www && \
    rm "phpMyAdmin-5.0.4-all-languages.tar.gz" && \
    cp "/var/www/html/phpmyadmin/config.sample.inc.php" "/var/www/html/phpmyadmin/config.inc.php" && \
    sed -i "s|localhost|$PMA_HOST|g" /var/www/html/phpmyadmin/config.inc.php
#    ln -s /usr/share/webapps/phpmyadmin/ /var/www/localhost/htdocs/phpmyadmin

EXPOSE 3306

CMD	[ "php", "-S", "$PMA_HOST:3306", "-t", "/var/www/html" ]
