#!/bin/sh

apt update -y
apt install apache2 -y 
cd  /var/www/html/
sudo wget https://github.com/justmorpheus/waf-dvwa/raw/main/DVWA.zip
apt install unzip -y
unzip DVWA.zip
apt install mysql-server -y
apt install mariadb-server -y
apt install php -y 
apt install php-mysqli -y
service apache2 restart

mysql -u root -p123 <<EOF
CREATE USER 'demo'@'%' IDENTIFIED BY 'password@123#';
GRANT ALL PRIVILEGES ON *.* TO 'demo'@'%';
flush privileges;
EOF
