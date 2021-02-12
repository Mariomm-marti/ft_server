#!/bin/bash

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
