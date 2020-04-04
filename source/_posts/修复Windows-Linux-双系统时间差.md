---
title: 修复Windows Linux 双系统时间差
date: 2019-05-10 14:18:10
tags:
- Windows
- Linux
- 双系统
---

装了双系统之后启动Windows后会有8个小时的时间差（北京时区），这是因为Linux在开机时候写入主板的时间的是有时区的时间，Windows开机后直接拿来用不包含时区，就造成了时间差。

<!-- more -->

## 1. Windows修复方式

打开注册表
```
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation\
```
下面增加一个名为 RealTimeIsUniversal 的 REG_DWORD 键，并赋值为1。

## 2. Linux修复方式

在终端中输入以下指令
```
sudo apt-get install ntpdate
sudo ntpdate time.windows.com
sudo hwclock --localtime --systohc
```
现在来回切换系统时间正常。