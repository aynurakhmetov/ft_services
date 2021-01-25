#!/bin/sh
openrc default
/etc/init.d/mariadb setup
rc-service mariadb start
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "CREATE USER 'root'@'%';" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'%' WITH GRANT OPTION;" | mysql -u root --skip-password
#echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
mysql wordpress -u root < /wordpress.sql
rc-service mariadb stop
cd '/usr' ; /usr/bin/mysqld_safe --datadir='/var/lib/mysql'
#/usr/bin/mysqld_safe --datadir='/var/lib/mysql'
shls