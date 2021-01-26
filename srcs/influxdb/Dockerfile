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
RUN apk add vim wget
RUN apk add openrc --no-cache
RUN apk add supervisor 

# GLIBC
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN apk add glibc-2.32-r0.apk
#RUN rm -f glibc-2.32-r0.apk

# INFLUXDB
RUN mkdir /var/lib/influxdb
VOLUME /var/lib/influxdb
RUN wget https://dl.influxdata.com/influxdb/releases/influxdb-1.8.3-static_linux_amd64.tar.gz
RUN tar xvfz influxdb-1.8.3-static_linux_amd64.tar.gz
RUN rm -f influxdb-1.8.3-static_linux_amd64.tar.gz
RUN mv /influxdb-1.8.3-1 /etc/influxdb/

# TELEGRAF
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz
RUN tar xf telegraf-1.17.0_linux_amd64.tar.gz
RUN rm -f telegraf-1.17.0_linux_amd64.tar.gz
RUN cp -r /telegraf-1.17.0/* /
COPY ./srcs_influxdb/telegraf.conf etc/telegraf/telegraf.conf
COPY ./srcs_influxdb/telegraf.conf telegraf-1.17.0/etc/telegraf/telegraf.conf
RUN chmod 755 etc/telegraf/telegraf.conf && chmod 755 telegraf-1.17.0/etc/telegraf/telegraf.conf

# SUPERVISORD
RUN mkdir -p /var/log/supervisor
COPY ./srcs_influxdb/supervisord.conf /etc/supervisord.conf

# EXPOSE & CMD
EXPOSE 8086
CMD ["/usr/bin/supervisord"]