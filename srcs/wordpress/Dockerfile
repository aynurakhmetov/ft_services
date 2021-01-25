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
RUN apk update && apk upgrade
RUN apk add nginx vim wget
RUN apk add openrc --no-cache
RUN apk add supervisor
RUN apk add php7 php7-fpm php7-opcache
RUN apk add php7-gd php7-mysqli php7-zlib php7-curl
RUN apk add php7-json php7-iconv php7-mbstring php7-gettext php7-session php7-phar

# NGINX
RUN mkdir -p /run/nginx
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY ./srcs_wordpress/default /etc/nginx/conf.d/default.conf

# WORDPRESS
RUN mkdir -p /run/php
RUN chmod -R 755 /var/www/*
#RUN apk add wordpress
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -zxvf latest.tar.gz
RUN rm -rf latest.tar.gz
RUN mv wordpress /var/www/
COPY ./srcs_wordpress/wp-config.php /var/www/wordpress/

# SUPERVISORD
COPY ./srcs_wordpress/supervisord.conf /etc/supervisord.conf

# EXPOSE & CMD
EXPOSE 5050
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]