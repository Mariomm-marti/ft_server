# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmartin- <mmartin-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/09 18:34:48 by mmartin-          #+#    #+#              #
#    Updated: 2021/02/12 20:52:59 by mmartin-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

ENV ROOT_USER="default_a9yCQkE23rbuL6As"
ENV ROOT_PSWD="default_8z3p5mjTn2cL0Ipk"

RUN echo "Installing MariaDB..." && \
	apt update && \
	apt upgrade -y && \
	apt install -y \
		mariadb-server nginx openssl php7.3-fpm php7.3-sql php-mysql \
		php-mbstring php-zip php-gd && \
	echo "Generating SSL certificate..." && \
	openssl req \
		-subj "/C=SP/ST=Madrid/L=Madrid/O=42Madrid/CN=mmartin-@student.42madrid.com" \
		-newkey rsa:2048 -nodes -keyout /etc/ssl/nginx.key -x509 -days 365 \
		-out /etc/ssl/nginx.crt

RUN apt install -y vim curl

COPY srcs/schedule.sh /
COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/php.ini /etc/php/7.3/fpm/php.ini
COPY --chown=www-data:www-data srcs/autoindex/ /var/www/autoindex/

EXPOSE 80 443

# curl https://wordpress.org/wordpress-5.2.9.tar.gz -o w.tar.gz; tar -xvzf w.tar.gz; rm w.tar.gz; /etc/init.d/mysql restart && /etc/init.d/nginx restart && /etc/init.d/php7.3-fpm start && bash /schedule.sh
# /etc/init.d/mysql restart && /etc/init.d/nginx restart && /etc/init.d/php7.3-fpm restart && bash /schedule.sh
# curl https://wordpress.org/wordpress-5.2.9.tar.gz -o w.tar.gz; tar -xvzf w.tar.gz; rm w.tar.gz

#ENTRYPOINT /etc/init.d/mysql start && \
#			/etc/init.d/nginx restart && \
#			/etc/init.d/php7.3-fpm start && \
# 			bash schedule.sh
