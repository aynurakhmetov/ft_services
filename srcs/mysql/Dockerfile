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
RUN apk add vim
RUN apk add openrc --allow-untrusted --no-cache

# SQL
#RUN apk add mysql mysql-client 
RUN apk add mysql mysql-client --allow-untrusted --no-cache
#RUN rm -f /var/cache/apk/*
VOLUME ["/var/lib/mysql"]
VOLUME ["/sys/fs/cgroup"]
COPY ./srcs_mysql/my.cnf /etc/mysql/my.cnf
RUN chmod 744 /etc/mysql/my.cnf

#START
COPY ./srcs_mysql/create_db.sh .
COPY ./srcs_mysql/wordpress.sql .
RUN chmod +x /create_db.sh
RUN chmod 755 /wordpress.sql

# EXPOSE & CMD
EXPOSE 3306
CMD ./create_db.sh 