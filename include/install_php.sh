#!/bin/bash

# 安装php
yum -y --enablerepo=epel,remi,remi-php70 install php-fpm php-cli php-gd php-mbstring php-mcrypt php-mysqlnd php-opcache php-pdo php-devel php-xml
sed -i 's/;date.timezone =/date.timezone = PRC/g' /etc/php.ini
sed -i 's,listen = 127.0.0.1:9000,listen = /var/run/php-fpm/php7-fpm.sock,g' /etc/php-fpm.d/www.conf
sed -i 's/;listen.owner = nobody/listen.owner = nginx/g' /etc/php-fpm.d/www.conf
sed -i 's/;listen.group = nobody/listen.group = nginx/g' /etc/php-fpm.d/www.conf
sed -i 's/;listen.mode = 0660/listen.mode = 0660/g' /etc/php-fpm.d/www.conf
systemctl enable php-fpm.service    # 添加php-fpm服务到开机启动项
systemctl start php-fpm.service     # 启动php-fpm

# 安装composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
composer config -g repo.packagist composer https://packagist.phpcomposer.com  # 修改镜像源为中国源
