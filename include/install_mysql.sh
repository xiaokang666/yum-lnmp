#!/bin/bash

# 安装mysql
rpm -Uvh http://repo.mysql.com/mysql57-community-release-el7-8.noarch.rpm
yum -y install mysql-community-server
systemctl enable mysqld.service   # 添加msyql服务到开机启动项
systemctl start mysqld.service    # 启动mysql服务

# 配置mysql密码
mysql_init_password=$(grep 'temporary password' /var/log/mysqld.log | sed 's/^.*root@localhost: //g')
mysqladmin -uroot -p$mysql_init_password password 'MyNewPass4!'
