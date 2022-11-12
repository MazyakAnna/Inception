FROM debian:buster

RUN apt-get update && apt-get install -y \
    php7.3 \
    php-gd \
    php-curl \
    php-xml \
    php-mysqli \
    php-imap \
    php-cgi \
    php-pdo \
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
63ae4e0a83475256625c6d4fc75a8e7eab590c67 f4b70ed5a71dda20dbe76c187ab919e907286ad6