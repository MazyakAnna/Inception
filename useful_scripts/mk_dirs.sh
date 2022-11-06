#!/bin/bash
mkdir project
mkdir project/srcs
touch project/Makefile
mkdir project/srcs/requirements
touch project/srcs/docker-compose.yml
touch project/srcs/.env
echo "DOMAIN=bmaegan.42.fr" > project/srcs/.env
echo "CERTIFICATE_=./requirements/tools/bmaegan.42.fr.crt" >> project/srcs/.env
echo "CERT_KEY_=./requirements/tools/bmaegan.42.fr.key" >> project/srcs/.env
echo "WP_DB_NAME=wordpress" >> project/srcs/.env
echo "DB_ROOT_PWD=12345" >> project/srcs/.env
echo "DB_USER=just_a_user" >> project/srcs/.env
echo "DB_PWD=54321" >> project/srcs/.env
mkdir project/srcs/requirements/bonus
mkdir project/srcs/requirements/mariadb
mkdir project/srcs/requirements/mariadb/conf
touch project/srcs/requirements/mariadb/conf/create_db.sh
mkdir project/srcs/requirements/mariadb/tools
touch project/srcs/requirements/mariadb/tools/.emptyfile
touch project/srcs/requirements/mariadb/Dockerfile
touch project/srcs/requirements/mariadb/.dockerignore
echo ".git" > project/srcs/requirements/mariadb/.dockerignore
echo ".env" >> project/srcs/requirements/mariadb/.dockerignore
mkdir project/srcs/requirements/nginx
mkdir project/srcs/requirements/nginx/conf
touch project/srcs/requirements/nginx/conf/nginx.conf
mkdir project/srcs/requirements/nginx/tools
touch project/srcs/requirements/nginx/Dockerfile
echo ".git" > project/srcs/requirements/mariadb/.dockerignore
echo ".env" >> project/srcs/requirements/mariadb/.dockerignore
mkdir project/srcs/requirements/tools
mkdir project/srcs/requirements/wordpress
mkdir project/srcs/requirements/wordpress/conf
touch project/srcs/requirements/wordpress/conf/wp-config-create.sh
mkdir project/srcs/requirements/wordpress/tools
echo "" > project/srcs/requirements/wordpress/tools/.emptyfile
touch project/srcs/requirements/wordpress/Dockerfile
touch project/srcs/requirements/wordpress/.dockerignore
echo ".git" > project/srcs/requirements/wordpress/.dockerignore
echo ".env" >> project/srcs/requirements/wordpress/.dockerignore




#  ID | user_login | user_pass                          | user_nicename | user_email  | user_url              | user_registered     | user_activation_key | user_status | display_name |
# +----+------------+------------------------------------+---------------+-------------+-----------------------+---------------------+---------------------+-------------+--------------+
# |  1 | LOLOL      | $P$BhxaSH2g4VyqIU6rZlXVpDO0TXBhM4. | lolol         | LOL@lol.lol | https://bmaegan.42.fr | 2022-11-06 18:46:18 |                     |           0 | LOLOL        |


# INSERT INTO 'wp_users'(ID, user_login, user_pass, user_nicename, user_email, user_url, user_registered, user_status, display_name) VALUES (1, $WORDPRESS_ADMIN_USER, $WORDPRESS_ADMIN_PASSWORD, IamGRoot, $WORDPRESS_ADMIN_EMAIL, https://bmaegan.42.fr, 2022-11-06 18:46:18 , 0,  Bellia Maegan)
# INSERT INTO 'wp_users'(ID, user_login, user_pass, user_nicename, user_email, user_url, user_registered, user_status, display_name) VALUES (2, $WORDPRESS_USER, $WORDPRESS_PASSWORD, reader, $WORDPRESS_USER_EMAIL, https://bmaegan.42.fr, 2022-11-06 18:46:18 , 0, Just_a_reader)

# INSERT INTO 'wp_usermeta' (user_id, meta_key, meta_value) VALUES (1, wp_capabilities, a:1:{s:13:"administrator";s:1:"1";})
# INSERT INTO 'wp_usermeta' (user_id, meta_key, meta_value) VALUES (2, wp_capabilities, a:1:{s:13:"administrator";s:1:"1";})


# INSERT INTO wp_users (ID, user_login, user_pass, user_nicename, user_email, user_url, user_registered, user_status, display_name) VALUES (4, 'keker', '12345', 'kecker', 'kek@kek.kek', 'https://bmaegan.42.fr', '2022-11-06 18:46:18' , 0, 'kek kek kek');
# INSERT INTO wp_usermeta (user_id, meta_key, meta_value) VALUES (4, 'wp_capabilities', 'a:1:{s:13:"administrator";s:1:"1";}');
