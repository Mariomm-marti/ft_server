# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmartin- <mmartin-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/09 18:34:48 by mmartin-          #+#    #+#              #
#    Updated: 2020/12/09 22:45:38 by mmartin-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

ENV ROOT_USER="default_a9yCQkE23rbuL6As"
ENV ROOT_PSWD="default_8z3p5mjTn2cL0Ipk"

RUN echo "Installing MariaDB..." && \
	apt update && \
	apt upgrade -y && \
	apt install -y mariadb-server nginx openssl && \
	echo "Generating SSL certificate..." && \
	openssl req \
		-subj "/C=SP/ST=Madrid/L=Madrid/O=42Madrid/CN=mmartin-@student.42madrid.com" \
		-newkey rsa:2048 -nodes -keyout /etc/ssl/nginx.key -x509 -days 365 \
		-out /etc/ssl/nginx.crt

COPY srcs/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443

ENTRYPOINT /etc/init.d/mysql start && /etc/init.d/nginx restart && sleep infinity
