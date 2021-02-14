#!/bin/bash

service mysql start

mysql -u root -e "CREATE DATABASE IF NOT EXISTS wordpress;"
mysql -u root wordpress < db.sql
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PSWD';"

service mysql restart
service php7.3-fpm start
service nginx start

echo "Everything is up and running..."

while true; do
	if [ -f /var/www/autoindex/.sch ]; then
		if [[ $(grep "autoindex on;" /etc/nginx/nginx.conf) ]]; then
			sed -i "s/autoindex on;/autoindex off;/g" /etc/nginx/nginx.conf
		else
			sed -i "s/autoindex off;/autoindex on;/g" /etc/nginx/nginx.conf
		fi
		echo "[$(date +%c)] Detected autoindex toggle request. Restarting nginx..."
		/usr/sbin/nginx -s reload
		rm -rf /var/www/autoindex/.sch
	fi
	sleep 0.3
done
