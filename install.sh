#!/bin/bash

cur_dir=$(pwd)

export cur_dir

./include/init.sh

./include/install_nginx.sh

./include/install_php.sh

./include/install_mysql.sh

./include/install_phpmyadmin.sh
