#!/bin/bash
minikube start --vm-driver=virtualbox
minikube addons enable metallb
kubectl apply -f ./srcs/metallb.yaml
eval $(minikube docker-env);

docker build -t nginx_img ./srcs/nginx
docker build -t phpmyadmin_img ./srcs/phpmyadmin
docker build -t wordpress_img ./srcs/wordpress
docker build -t mysql_img ./srcs/mysql
docker build -t ftps_img ./srcs/ftps
docker build -t grafana_img ./srcs/grafana
docker build -t influxdb_img ./srcs/influxdb

# docker run -it -p 80:80 -p 443:443 nginx_img /bin/sh
# docker run -it -p 5000:5000 phpmyadmin_img /bin/sh
# docker run -it -p 5050:5050 wordpress_img /bin/sh
# docker run -it -p 3306:3306 mysql_img /bin/sh
# docker run -it -p 21:21 ftps_img /bin/sh
# docker run -it -p 3000:3000 grafana_img /bin/sh
# docker run -it -p 8086:8086 influxdb_img /bin/sh

kubectl apply -f ./srcs/nginx.yaml
kubectl apply -f ./srcs/phpmyadmin.yaml
kubectl apply -f ./srcs/wordpress.yaml
kubectl apply -f ./srcs/mysql.yaml
kubectl apply -f ./srcs/ftps.yaml
kubectl apply -f ./srcs/grafana.yaml
kubectl apply -f ./srcs/influxdb.yaml

minikube dashboard
# minikube delete
# kubectl delete -f ./srcs/nginx.yaml
# kubectl exec deploy/nginx-deployment -- pkill nginx
# kubectl exec deploy/nginx-deployment -- pkill sshd
# kubectl exec deploy/phpmyadmin-deployment -- pkill php-fpm
# kubectl exec deploy/wordpress-deployment -- pkill php-fpm
# kubectl exec deploy/influxdb-deployment -- pkill influxdb
# kubectl exec deploy/influxdb-deployment -- pkill telegraf
# kubectl exec deploy/grafana-deployment -- pkill grafana
# kubectl exec deploy/ftps-deployment -- pkill vsftpd

# ssh gmarva@192.168.99.188

# Take DB. In pod do "cp ../data ."  
# kubectl cp grafana-deployment-58b59d7fb7-m7nnt:grafana.db /Users/gmarva/Documents/grafana.db
# curl -I http://192.168.99.188:80
# curl -I -k https://192.168.99.188:443/wordpress
# curl -I -k https://192.168.99.188:443/phpmyadmin/