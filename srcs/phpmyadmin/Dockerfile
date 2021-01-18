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
RUN apk add nginx vim wget
RUN apk add openssl supervisor
RUN apk add php-fpm php-mysql
RUN apk add php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip

# SSL
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=ru/ST=Kazan/L=Kazan/O=no/OU=no/CN=phpmyadmin" -keyout /etc/ssl/private/localhost.key -out /etc/ssl/certs/localhost.crt

# NGINX + config
RUN mkdir -p /run/nginx
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY ./srcs_nginx/default /etc/nginx/conf.d/default.conf

# PHPMYADMIN
RUN chown -R www-data:www-data /var/www
RUN chmod -R 755 /var/www/*
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.3/phpMyAdmin-5.0.3-all-languages.tar.gz
RUN tar -zxvf phpMyAdmin-5.0.3-all-languages.tar.gz
RUN rm -rf phpMyAdmin-5.0.3-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.3-all-languages/ /var/www/phpmyadmin
COPY ./srcs/config.inc.php /var/www/phpmyadmin/

EXPOSE 5050

# CMD
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]