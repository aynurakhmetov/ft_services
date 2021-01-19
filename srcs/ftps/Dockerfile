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
RUN apk add supervisor openssl vsftpd

# SSL
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=ru/ST=Kazan/L=Kazan/O=no/OU=no/CN=ftps" -keyout /etc/ssl/private/localhost.key -out /etc/ssl/certs/localhost.crt

# FTPS


EXPOSE 21

# CMD
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]