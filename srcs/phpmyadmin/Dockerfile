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
# OS
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
COPY ./srcs_phpmyadmin/default /etc/nginx/conf.d/default.conf

# PHPMYADMIN
RUN mkdir -p /run/php
RUN chmod -R 755 /var/www/*
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.3/phpMyAdmin-5.0.3-all-languages.tar.gz
RUN tar -zxvf phpMyAdmin-5.0.3-all-languages.tar.gz
RUN rm -rf phpMyAdmin-5.0.3-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.3-all-languages/ /var/www/phpmyadmin
COPY ./srcs_phpmyadmin/config.inc.php /var/www/phpmyadmin/

# SUPERVISORD
RUN mkdir -p /var/log/supervisor
COPY ./srcs_phpmyadmin/supervisord.conf /etc/supervisord.conf

# EXPOSE & CMD
EXPOSE 5000
CMD ["/usr/bin/supervisord"]