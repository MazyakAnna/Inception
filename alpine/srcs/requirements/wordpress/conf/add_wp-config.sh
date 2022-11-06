#!bin/sh
# https://wordpress.org/support/article/how-to-install-wordpress/#step-3-set-up-wp-config-php
# https://developer.wordpress.org/apis/wp-config-php/
if [ ! -f "/var/www/html/wordpress/wp-config.php" ]; then
touch /var/www/html/wordpress/wp-config.php &&
cat << EOF > /var/www/html/wordpress/wp-config.php
<?php
define( 'DB_NAME', '${WORDPRESS_DB_NAME}' );
define( 'DB_USER', '${WORDPRESS_DB_USER}' );
define( 'DB_PASSWORD', '${WORDPRESS_DB_PASSWORD}' );
define( 'DB_HOST', '${WORDPRESS_DB_HOST}' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
define('FS_METHOD','direct');
\$table_prefix = '${WORDPRESS_TABLE_PREFIX}';
define( 'WP_SITEURL', 'https://${DOMAIN_NAME}' );
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', true );
if ( ! defined( 'ABSPATH' ) ) {
define( 'ABSPATH', __DIR__ . '/' );}
define( 'WP_REDIS_HOST', '${REDIS_HOST}' );
define( 'WP_REDIS_PASSWORD', '${REDIS_PASSWORD}' );
define( 'WP_REDIS_PORT', 6379 );
define( 'WP_REDIS_TIMEOUT', 1 );
define( 'WP_REDIS_READ_TIMEOUT', 1 );
define( 'WP_REDIS_DATABASE', 0 );
require_once ABSPATH . 'wp-settings.php';
EOF
fi