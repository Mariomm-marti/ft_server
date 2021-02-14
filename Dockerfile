# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmartin- <mmartin-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/09 18:34:48 by mmartin-          #+#    #+#              #
#    Updated: 2021/02/14 16:15:00 by mmartin-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

ENV ROOT_PSWD="default_8z3p5mjTn2cL0Ipk"

RUN apt update && \
	apt upgrade -y && \
	apt install -y \
		mariadb-server nginx openssl php7.3-fpm php7.3-sql php-mysql \
		php-mbstring php-zip php-gd && \
	openssl req \
		-subj "/C=SP/S T=Madrid/L=Madrid/O=42Madrid/CN=mmartin-@student.42madrid.com" \
		-newkey rsa:2048 -nodes -keyout /etc/ssl/nginx.key -x509 -days 365 \
		-out /etc/ssl/nginx.crt

COPY srcs/setup.sh /
COPY srcs/db.sql /
COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY --chown=www-data:www-data srcs/www/ /var/www/

EXPOSE 80 443

ENTRYPOINT /setup.sh 
