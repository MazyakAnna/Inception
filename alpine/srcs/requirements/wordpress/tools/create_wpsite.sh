#!/bin/sh

while ! mariadb -h $MYSQL_HOST -P 3306 -u $MYSQL_USER -p $MYSQL_PASSWORD; do echo "waiting for db ..."; done
wp core install --url="$DOMAIN" --title="random title" --admin_user="$WORDPRESS_ADMIN_USER" --admin_password="$WORDPRESS_ADMIN_PASSWORD" --admin_email="$WORDPRESS_ADMIN_EMAIL" --skip-email
wp plugin install hello-dolly --activate
wp theme install twentytwenty --activate
wp plugin update --all
wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --role=author --user_pass=$WORDPRESS_USER_PASSWORD
wp post create --post_title="RANDOM TITLE" --post_content="RANDOM CONTENT" --post_status=publish --post_author="$WORDPRESS_USER"


