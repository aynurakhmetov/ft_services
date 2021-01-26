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

# GLIBC
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN apk add glibc-2.32-r0.apk
#RUN rm -f glibc-2.32-r0.apk

# GRAFANA
RUN wget https://dl.grafana.com/oss/release/grafana-7.3.7.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.3.7.linux-amd64.tar.gz
RUN rm -f grafana-7.3.7.linux-amd64.tar.gz
WORKDIR /grafana-7.3.7/bin/

COPY ./srcs_grafana/grafana.db ../data/

# EXPOSE & CMD
EXPOSE 3000
CMD ["./grafana-server"]