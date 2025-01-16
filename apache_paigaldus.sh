#!/bin/bash

# script to install and start apache2 service
#
# checks if apache2 package is installed
APACHE2=$(dpkg-query -W -f='${status}' apache2 2>/dev/null | grep -c 'ok installed')

# if apache 2 is not installed
if [ $APACHE2 -eq 0 ]; then
	# installs apache2 and shows status
	echo
	echo "Installing package apache2"
	echo
	apt install apache2 -y
	echo
	echo "apache2 package has been installed"
	echo
	systemctl status apache2
# if apache is installed
elif [ $APACHE2 -eq 1 ]; then
	# shows apache2 status
	echo
	echo "apache2 package has already been installed"
	echo
	systemctl status apache2
fi
