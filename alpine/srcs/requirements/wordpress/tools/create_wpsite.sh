#!/bin/sh

while ! mariadb -h $WORDPRESS_DB_HOST -P 3306 -u $WORDPRESS_DB_USER -p $WORDPRESS_DB_PASSWORD; do echo "waiting for db ..."; done
# [--config-file=<path>] 
wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --dbprefix=$WORDPRESS_TABLE_PREFIX --extra-php <<PHP
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', true );
define( 'WP_REDIS_HOST', '${REDIS_HOST}' );
define( 'WP_REDIS_PASSWORD', '${REDIS_PASSWORD}' );
define( 'WP_REDIS_PORT', 6379 );
define( 'WP_REDIS_TIMEOUT', 1 );
define( 'WP_REDIS_READ_TIMEOUT', 1 );
define( 'WP_REDIS_DATABASE', 0 );
PHP

wp core install --url="$DOMAIN_NAME" --title="random title" --admin_user="$WORDPRESS_ADMIN_USER" --admin_password="$WORDPRESS_ADMIN_PASSWORD" --admin_email="$WORDPRESS_ADMIN_EMAIL" --skip-email --allow-root
wp plugin install hello-dolly --activate
wp theme install twentytwenty --activate
wp plugin update --all
wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --role=author --user_pass=$WORDPRESS_USER_PASSWORD  --allow-root;
wp post create --post_title="RANDOM TITLE" --post_content="RANDOM CONTENT" --post_status=publish --post_author="$WORDPRESS_USER"
wp theme install inspiro --activate --allow-root
