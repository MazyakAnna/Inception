#!/bin/sh
# while ! mariadb -h$WORDPRESS_DB_HOST -P3306 -u$WORDPRESS_DB_USER -p$WORDPRESS_DB_PASSWORD; do echo "waiting for db ..."; done

echo "CHECK"
mkdir -p /run/php/
if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
    
echo "No config, let's create one!"
    cd /var/www/html/wordpress;
# static website
# mkdir -p /var/www/html/wordpress/staticwebsite;
    # mv /var/www/index.html /var/www/html/wordpress/staticwebsite/index.html;

#    wp core install --url="$DOMAIN_NAME" --title="$WORDPRESS_DB_NAME" --admin_user="root" --admin_password="$MYSQL_ROOT_PASSWORD" --admin_email="$WORDPRESS_ROOT_EMAIL" --path="/var/www/html/wordpress" --skip-email --allow-root
    wp config create --dbname=$WORDPRESS_DB_NAME --dbuser="$WORDPRESS_ADMIN_USER" --dbpass="$WORDPRESS_ADMIN_PASSWORD" --dbhost=$WORDPRESS_DB_HOST --dbprefix=$WORDPRESS_TABLE_PREFIX --path="/var/www/html/wordpress"  --config-file="wp-config.php" --allow-root --extra-php << PHP
define( 'WP_SITEURL', 'https://$DOMAIN_NAME' );
define( 'WP_HOME', 'https://$DOMAIN_NAME' ); 
define( 'WP_REDIS_HOST', 'redis' );
define( 'WP_REDIS_PORT', 6379 );
define( 'WP_REDIS_TIMEOUT', 1 );
define( 'WP_REDIS_READ_TIMEOUT', 1 );
define( 'WP_REDIS_DATABASE', 0 );
PHP

    wp core install --url="$DOMAIN_NAME" --title="$WORDPRESS_DB_NAME" --admin_user="$WORDPRESS_ADMIN_USER" --admin_password="$WORDPRESS_ADMIN_PASSWORD" --admin_email="$WORDPRESS_ADMIN_EMAIL" --path="/var/www/html/wordpress" --skip-email --allow-root
    wp db import /tmp/conf/exported_database.sql --path='/var/www/html//wordpress' --allow-root;
    wp user create "$WORDPRESS_USER" "$WORDPRESS_USER_EMAIL" --role=author --user_pass="$WORDPRESS_USER_PASSWORD"  --path="/var/www/html/wordpress" --allow-root;
    wp user create "$WORDPRESS_ADMIN_USER" "$WORDPRESS_ADMIN_EMAIL" --role=administrator --user_pass="$WORDPRESS_ADMIN_PASSWORD" --path="/var/www/html/wordpress" --allow-root;
    sed -i 's|<h1 class="alignwide" style="margin-bottom:var(--wp--preset--spacing--60)">Mindblown: a blog about philosophy.</h1>|<h1 class="alignwide" style="margin-bottom:var(--wp--preset--spacing--60)">WOW! Look! This Inception project is working!</h1>|g' /var/www/html/wordpress/wp-content/themes/twentytwentythree/templates/home.html

# install redis plagin
    wp plugin install redis-cache --activate --allow-root
    wp plugin update --all --allow-root

fi

echo "Wordpress config: OK"
php-fpm7.3 -F
