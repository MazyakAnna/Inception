#!/bin/sh

# while ! mariadb -h $WORDPRESS_DB_HOST -P 3306 -u $WORDPRESS_DB_USER -p $WORDPRESS_DB_PASSWORD; do echo "waiting for db ..."; done
wp core install --url="$DOMAIN_NAME" --title="random title" --admin_user="$WORDPRESS_ADMIN_USER" --admin_password="$WORDPRESS_ADMIN_PASSWORD" --admin_email="$WORDPRESS_ADMIN_EMAIL" --skip-email --allow-root
wp plugin install hello-dolly --activate
wp theme install twentytwenty --activate
wp plugin update --all
wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --role=author --user_pass=$WORDPRESS_USER_PASSWORD  --allow-root;
wp post create --post_title="RANDOM TITLE" --post_content="RANDOM CONTENT" --post_status=publish --post_author="$WORDPRESS_USER"
wp theme install inspiro --activate --allow-root
