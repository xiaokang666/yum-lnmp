#!/bin/bash

# 安装phpmyadmin
curl -O https://files.phpmyadmin.net/phpMyAdmin/4.6.2/phpMyAdmin-4.6.2-all-languages.tar.gz
tar -zxvf phpMyAdmin-4.6.2-all-languages.tar.gz -C /var/www/
mv /var/www/phpMyAdmin-4.6.2-all-languages /var/www/phpmyadmin
rm -f phpMyAdmin-4.6.2-all-languages.tar.gz 
