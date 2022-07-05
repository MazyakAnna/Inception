CREATE DATABASE wordpress;
CREATE USER 'bmaegan'@'%' IDENTIFIED BY 'qwerty';
GRANT ALL PRIVILEGES ON wordpress.*
	TO 'bmaegan'@'%'
-- 	IDENTIFIED BY pasSword;
FLUSH PRIVILEGES;
