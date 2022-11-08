FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
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

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
    mv adminer-4.8.1.php index.php && chown -R root:root /var/www//html

EXPOSE 8080

CMD	[ "php", "-S", "[::]:8080", "-t", "/var/www/html" ]
