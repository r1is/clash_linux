#!/bin/bash

if ! [ `id -u` = 0 ];then
  echo "现在你使用的账号是：`whoami` ，请使用root账户运行此脚本"
  sleep 3
  exit 1
fi

if [ -d ./clash ];then
  cp -r ./clash /etc
  cp ./clash/clash.service /etc/systemd/system
  systemctl enable clash.service
  systemctl start clash.service
fi
