#!/bin/bash

# 安装ngixn
rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
yum -y install nginx
mv /usr/share/nginx /var/www     # 修改虚拟主机目录位置
cp -r ${cur_dir}/conf/default.conf /etc/nginx/conf.d/default.conf
systemctl enable nginx.service   # 添加nginx服务到开机启动项
systemctl start nginx.service    # 启动nginx服务
