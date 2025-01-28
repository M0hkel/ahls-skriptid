#!/bin/bash

# script to install wordpress
#
# checks if wordpress package is installed
WP=$(dpkg-query -W -f='${status}' wordpress 2>/dev/null | grep -c 'ok installed')

# if wordpress is not installed
if [ $WP -eq 0 ]; then
	# installs wordpress and shows status
	echo -e "\nInstalling package wordpress\n"
	apt install unzip -y
	wget https://wordpress.org/latest.zip
	unzip latest.zip -d /var/www/html/
	rm latest.zip
	echo -e "\nwordpress package has been installed\n"
# if wordpress is installed
elif [ $WP -eq 1 ]; then
	# shows wordpress status
	echo -e "\nwordpress package has already been installed\n"
fi

# if the config file does not exist copies it from the default folder
if [ ! -e "/var/www/html/wordpress/wp-config.php" ]; then
	cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
	# replaces the database settings
	sed -i "s/database_name_here/wpdatabse/g" /var/www/html/wordpress/wp-config.php
	sed -i "s/username_here/wpuser/g" /var/www/html/wordpress/wp-config.php
	sed -i "s/password_here/qwerty/g" /var/www/html/wordpress/wp-config.php
	echo -e "\nconfig file created\n"
else
	echo -e "\nconfig file exists\n"
fi
