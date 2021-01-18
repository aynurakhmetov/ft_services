# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gmarva <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/15 19:10:35 by gmarva            #+#    #+#              #
#    Updated: 2021/01/15 19:13:26 by gmarva           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#layers
#1 OS
FROM alpine:3.12

# INSTALL
RUN apk update
RUN apk add nginx vim rs-service
RUN apk add openssl supervisor default-mysql-server default-mysql-client

# SSL
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=ru/ST=Kazan/L=Kazan/O=no/OU=no/CN=mysql" -keyout /etc/ssl/private/localhost.key -out /etc/ssl/certs/localhost.crt

# NGINX + config
RUN mkdir -p /run/nginx
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY ./srcs_mysql/default /etc/nginx/conf.d/default.conf

COPY ./srcs_sql/create_bd.sh .
RUN sh ./create_bd.sh

EXPOSE 3306

# CMD
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]