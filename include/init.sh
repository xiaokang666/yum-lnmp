#!/bin/bash

# 配置Base源
yum clean all
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
cp -f ${cur_dir}/conf/Centos-7.repo /etc/yum.repos.d/CentOS-Base.repo


# 配置epel源
rpm -Uvh https://mirrors.tuna.tsinghua.edu.cn/epel/epel-release-latest-7.noarch.rpm
cp -f ${cur_dir}/conf/epel-7.repo /etc/yum.repos.d/epel.repo
cp -f ${cur_dir}/conf/epel-testing.repo /etc/yum.repos.d/epel-testing.repo


# 配置remi源
rpm -Uvh https://mirrors.tuna.tsinghua.edu.cn/remi/enterprise/remi-release-7.rpm
cp ${cur_dir}/conf/remi.repo /etc/yum.repos.d/remi.repo
cp ${cur_dir}/conf/remi-php70.repo /etc/yum.repos.d/remi-php70.repo
cp ${cur_dir}/conf/remi-safe.repo /etc/yum.repos.d/remi-safe.repo

yum -y update

# 配置防火墙
firewall-cmd --permanent --zone=public --add-service=http   # 允许http服务端口访问
firewall-cmd --permanent --zone=public --add-service=https  # 允许https服务端口访问
firewall-cmd --reload   # 重启防火墙服务
