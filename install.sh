#!/bin/bash

if ! [ `id -u` = 0 ];then
  echo "现在你使用的账号是：`whoami` ，请使用root账户运行此脚本"
  sleep 3
  exit 1
fi

if [ -d ./clash ];then
  cp -r ./clash /etc
  chmod +x /etc/clash/clash
  cp ./clash/clash.service /etc/systemd/system
  systemctl enable clash.service
  systemctl start clash.service
  echo ""
  /ect/clash/clash -v
  echo "Clash install sucess...."
  echo "Clash配置文件路径：/etc/clash"
  echo "开启clash: systemctel start clash"
  echo "关闭clash: systemctel stop clash"
fi
