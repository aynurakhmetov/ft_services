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
RUN apk add nginx vim
RUN apk add openssl openssh supervisor
RUN apk add openrc --no-cache
RUN apk add php7 php7-fpm php7-opcache
RUN apk add php7-gd php7-mysqli php7-zlib php7-curl
RUN apk add php7-json php7-iconv php7-mbstring php7-gettext php7-session php7-phar 

# SSL
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=ru/ST=Kazan/L=Kazan/O=no/OU=no/CN=localhost" -keyout /etc/ssl/private/localhost.key -out /etc/ssl/certs/localhost.crt

# NGINX + config
RUN mkdir -p /run/nginx
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY ./srcs_nginx/default /etc/nginx/conf.d/default.conf

# SSH + config + ssh_user + ssh_key_activation
#RUN mkdir -p /run/ssh
RUN rm -rf /etc/ssh/sshd_config
COPY ./srcs_nginx/sshd_config /etc/ssh/sshd_config
RUN adduser -D gmarva
RUN echo gmarva:gmarva | chpasswd
RUN /usr/bin/ssh-keygen -A

# TEST
COPY ./srcs_nginx/index.html /var/www/localhost/

# PORTS
EXPOSE 80 443 22

# CMD
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

# Редирект WORDPRESS реверс (обратный прокси) PHP в default
