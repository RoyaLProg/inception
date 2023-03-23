#!/bin/sh

# sed -i s/"define( 'DB_NAME', 'database_name_here' );"/"define( 'DB_NAME', '$WORDPRESSDB' );"/ /var/www/html/wordpress/wp-config.php
# sed -i s/"define( 'DB_USER', 'username_here' );"/"define( 'DB_USER', '$WORDPRESSUSER' );"/ /var/www/html/wordpress/wp-config.php
# sed -i s/"define( 'DB_PASSWORD', 'password_here' );"/"define( 'DB_PASSWORD', '$WORDPRESSPASSWORD' );"/ /var/www/html/wordpress/wp-config.php
# sed -i s/"define( 'DB_HOST', 'localhost' );"/"define( 'DB_HOST', 'mariadb' );"/ /var/www/html/wordpress/wp-config.php
wp core download --allow-root;
wp config create --dbname=$WORDPRESSDB --dbuser=$WORDPRESSUSER --dbpass=$WORDPRESSPASSWORD --dbhost=mariadb --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root;
wp core install --url=ccambium.42.fr --title=inception --admin_user=$ADMINUSER --admin_password=$ADMINPASSWORD --admin_email=$ADMINEMAIL --skip-email --allow-root;
wp user create $USER $USEREMAIL --role=author --user_pass=$USERPASS --allow-root;

chown -R www-data:www-data /var/www/html
echo "wp-config done !"
exec "$@"
