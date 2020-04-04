---
layout: post
title: Linux 防火墙端口设置
date: 2019-06-21 14:43:34
tags:
- Linux
- 端口
---

## 防火墙设置

**CentOS 7**、**RedHat 7** 之前的 **Linux** 发行版防火墙设置
```
#开启
service iptables start
#关闭
service iptables stop
```
加入开机启动
```
#开启
chkconfig iptables on
#关闭
chkconfig iptables off
```
**CentOS 7**、**RedHat 7** 之后的 **Linux** 发行版防火墙设置
```
##开启
systemctl start firewalld.service
##关闭
systemctl stop firewalld.service
```

## 端口设置

**CentOS 7**、**RedHat 7** 之前的 **Linux** 发行版端口设置

```
##开启27017端口接收数据
/sbin/iptables -I INPUT -p tcp --dport 27017 -j ACCEPT
#开启27017端口发送数据
/sbin/iptables -I OUTPUT -p tcp --dport 27017 -j ACCEPT
#保存配置
/etc/rc.d/init.d/iptables save
#重启防火墙服务
/etc/rc.d/init.d/iptables restart
#查看是否开启成功
/etc/init.d/iptables status
```

**CentOS 7**、**RedHat 7**之后的 **Linux** 发行版端口设置
```
# --zone 作用域
# --add-port=27017/tcp 添加端口，格式为：端口/通讯协议
# --permanent 永久生效，没有此参数重启后失效
firewall-cmd --zone=public --add-port=27017/tcp --permanent
```