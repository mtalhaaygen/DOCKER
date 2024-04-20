CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS `$(WP_USER_LOGIN)`@'%' IDENTIFIED BY `$(WP_USER_PASSWORD)`;
GRANT ALL PRIVILEGES ON wordpress.* TO 'maygen'@'%';
FLUSH PRIVILEGES;
ALTER USER `$(WP_ADMIN_LOGIN)`@'localhost' IDENTIFIED BY `$(WP_ADMIN_PASSWORD)`;
