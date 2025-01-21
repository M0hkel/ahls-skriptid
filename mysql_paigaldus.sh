#!/bin/bash

# script to install latest mysql-server package and extensions
#
# checks if mysql-server package is installed
MYSQL=$(dpkg-query -W -f='${status}' mysql-server 2>/dev/null | grep -c 'ok installed')

# if mysql-server is not installed
if [ $MYSQL -eq 0 ]; then
	# installs mysql-server
	echo -e "\nInstalling package mysql-server\n"
	apt install mysql-server -y
	echo -e "\nmysql-server package has been installed\n"
	# adds the ability to use mysql command without adding a user or password
	touch $HOME/.my.cnf
	echo "[client]" >>$HOME/.mv.cnf
	echo "host = localhost" >>$HOME/.mv.cnf
	echo "user = root" >>$HOME/.mv.cnf
	echo "password = qwerty" >>$HOME/.mv.cnf
# if mysql-server is installed
elif [ $MYSQL -eq 1 ]; then
	# shows mysql-server version ja asukohta
	echo -e "\nmysql-server package has already been installed\n"
	mysql
fi
