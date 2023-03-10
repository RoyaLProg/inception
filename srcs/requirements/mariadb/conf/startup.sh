#!/bin/sh

mysql_install_db

/etc/init.d/mysql start

#Check if the database exists

if [ -d "/var/lib/mysql/$WORDPRESSDB" ]
then 
	echo "$WORDPRESSDB already exists"
else

# Set root option so that connexion without root password is not possible

mysql_secure_installation << EOF

Y
jesuislemdp
jesuislemdp
Y
n
Y
Y
EOF

#Flush privileges to update tables permissions immediatly
echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$ROOTPASSORD'; FLUSH PRIVILEGES;" | mysql -uroot

#Create database and user in the database for wordpress
echo "CREATE DATABASE IF NOT EXISTS $WORDPRESSDB; GRANT ALL ON $WORDPRESSDB.* TO '$WORDPRESSUSER'@'%' IDENTIFIED BY '$WORDPRESSPASSWORD'; FLUSH PRIVILEGES;" | mysql -u root

#Import database in the mysql command line
# mysql -uroot -p$ROOTPASSORD $WORDPRESSDB < /usr/local/bin/setup_wordpress.sql

fi

/etc/init.d/mysql stop

exec "$@"
