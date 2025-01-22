#!/bin/bash

# script to install and setup Apache, PHP, MySQL and Wordpress
#
# checks if apache2 package is installed
APACHE2=$(dpkg-query -W -f='${status}' apache2 2>/dev/null | grep -c 'ok installed')

# if package not installed runs auto install script
if [ $APACHE2 -eq 0 ]; then
	./apache_paigaldus.sh
fi

# checks if php package is installed
PHP=$(dpkg-query -W -f='${status}' php 2>/dev/null | grep -c 'ok installed')
# if package not installed runs auto install script

if [ $PHP -eq 0 ]; then
	./php_paigaldus.sh
fi

# checks if mysql-server package is installed
MYSQL=$(dpkg-query -W -f='${status}' mysql-server 2>/dev/null | grep -c 'ok installed')

# if package not installed runs auto install script
if [ $MYSQL -eq 0 ]; then
	./mysql_paigaldus.sh
fi

# checks if wordpress package is installed
WP=$(dpkg-query -W -f='${status}' wordpress 2>/dev/null | grep -c 'ok installed')

# if package not installed runs auto install script
if [ $WP -eq 0 ]; then
	./andmebaas.sh
	./wordpress_paigaldus.sh
fi
