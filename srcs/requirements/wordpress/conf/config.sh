#!/bin/sh

sed -i s/"define( 'DB_NAME', 'database_name_here' );"/"define( 'DB_NAME', '$WORDPRESSDB' );"/ /var/www/html/wordpress/wp-config.php
sed -i s/"define( 'DB_USER', 'username_here' );"/"define( 'DB_USER', '$WORDPRESSUSER' );"/ /var/www/html/wordpress/wp-config.php
sed -i s/"define( 'DB_PASSWORD', 'password_here' );"/"define( 'DB_PASSWORD', '$WORDPRESSPASSWORD' );"/ /var/www/html/wordpress/wp-config.php
sed -i s/"define( 'DB_HOST', 'localhost' );"/"define( 'DB_HOST', 'mariadb' );"/ /var/www/html/wordpress/wp-config.php
sed -i s/"define( 'WP_DEBUG', true );"/"define( 'WP_DEBUG', true );"/ /var/www/html/wordpress/wp-config.php
echo "wp-config done !"
exec "$@"
