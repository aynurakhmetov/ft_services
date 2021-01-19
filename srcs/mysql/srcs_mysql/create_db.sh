#!/bin/sh

rc-service mysql start
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'gmarva'@'%' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "update mysql.user set plugin='mysql_native_password' where user='gmarva';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
sh