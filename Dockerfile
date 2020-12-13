# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmartin- <mmartin-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/09 18:34:48 by mmartin-          #+#    #+#              #
#    Updated: 2020/12/11 21:30:29 by mmartin-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

ENV ROOT_USER="default_a9yCQkE23rbuL6As"
ENV ROOT_PSWD="default_8z3p5mjTn2cL0Ipk"

RUN echo "Installing MariaDB..." && \
	apt update && \
	apt upgrade -y && \
	apt install -y \
		mariadb-server nginx openssl php-fpm \
		php-mbstring php-zip php-gd && \
	echo "Generating SSL certificate..." && \
	openssl req \
		-subj "/C=SP/ST=Madrid/L=Madrid/O=42Madrid/CN=mmartin-@student.42madrid.com" \
		-newkey rsa:2048 -nodes -keyout /etc/ssl/nginx.key -x509 -days 365 \
		-out /etc/ssl/nginx.crt

RUN apt install -y vim curl

COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/php.ini /etc/php/7.3/fpm/php.ini

EXPOSE 80 443

# ENTRYPOINT /etc/init.d/mysql start && \
# 			/etc/init.d/nginx restart && \
#			/etc/init.d/php7.3-fpm start && \
# 			sleep infinity
