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

# FTPS
RUN apk add vsftpd
RUN echo 'root:root' | chpasswd
COPY ./srcs_ftps/vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN mkdir -p /var/log/ftp
RUN touch /var/log/ftp/xferlog

# SSL
RUN apk add openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=ru/ST=Kazan/L=Kazan/O=no/OU=no/CN=ftps" -keyout /etc/vsftpd/vsftpd.pem -out /etc/vsftpd/vsftpd.pem

# EXPOSE & CMD
EXPOSE 21 10100
ENTRYPOINT vsftpd /etc/vsftpd/vsftpd.conf
#CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]