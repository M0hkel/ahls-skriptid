#!/bin/bash

# script to install wordpress
#
# checks if wordpress package is installed
WP=$(dpkg-query -W -f='${status}' wordpress 2>/dev/null | grep -c 'ok installed')

# if wordpress is not installed
if [ $WP -eq 0 ]; then
	# installs wordpress and shows status
	echo -e "\nInstalling package wordpress\n"
	apt install wordpress -y
	echo -e "\nwordpress package has been installed\n"
# if wordpress is installed
elif [ $WP -eq 1 ]; then
	# shows wordpress status
	echo -e "\nwordpress package has already been installed\n"
fi

# if the config file does not exist copies it from the default folder
if [ ! -e "/etc/wordpress/config-default.php" ]; then
	cp /usr/share/wordpress/wp-config-sample.php /etc/wordpress/config-default.php
	# replaces the database settings
	sed -i "s/database_name_here/wordpress/g"
	sed -i "s/username_here/wpuser/g"
	sed -i "s/password_here/qwerty/g"
fi
