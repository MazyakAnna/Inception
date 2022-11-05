sudo service mysqld start
echo "CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO 'bmaegan'@'localhost' IDENTIFIED BY '12';
FLUSH PRIVILEGES;
UPDATE mysql.user SET plugin='' WHERE user = 'bmaegan';
FLUSH PRIVILEGES;" | mysql -u root --skip-password
