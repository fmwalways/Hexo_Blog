---
title: GitHub pages 搭建Hexo博客教程
date: 2017-08-18 13:38:25
tags:
  - Hexo
  - GitHub pages
  - 博客
---

## 序言

之前买的服务器到期了，每个月续费感觉有点麻烦，索性就用了Github pages搭建Hexo博客，有考虑过用oschina的pages而且oschina上面可以创建私有仓库，但找了好久没有看到CHAME服务，这个想法也就做罢了。
<!-- more -->

## 搭建环境

- Node.js环境配置
- Github的账户配置
- Hexo环境配置

### 配置Node.js
  1.下载node.js
      [Windows installer 32-bit](https://nodejs.org/dist/v8.4.0/node-v8.4.0-x86.msi)
      [Windows installer 64-bit](https://nodejs.org/dist/v8.4.0/node-v8.4.0-x64.msi)
这里提供了Windows平台的快捷下载，下载其他版本的Node.js[点此](https://nodejs.org/zh-cn/download/current/)

  2.下载完成之后就可以安装了，如果不需要更改安装目录的话，一路Next就可以了，最后我们通过命令行检查一下是否安装成功。
```
node -v
v6.9.5

npm -v
3.10.10
```

### Git的安装和账户配置

1.首先下载Git安装：
[Git官网下载](https://git-scm.com/downloads)
安装过程不再详述，基本上就是Next就可以了。最后我们检查一下安装是否成功。

```
git --version
git version 2.13.0.windows.1
```
2.Git 账户配置：
如果没有Github账号先去注册账号 [GitHub](https://github.com/)
创建代码库
![](https://dev.tencent.com/u/fomav/p/Hexo_Res/git/raw/master/20170818230706.png)

注意：如果你想用yourname.github.io这种类型的域名，你在创建仓库的名称的时候就该这样命名yourname.github.io，否则GitHub会给你生成一个yourname.github.io/projectname的地址
![](https://dev.tencent.com/u/fomav/p/Hexo_Res/git/raw/master/20170818232507.png)

仓库创建好以后我们就去项目主页中的Setting中找到GitHub Pages Source选项选择master branch 点击save

![](https://dev.tencent.com/u/fomav/p/Hexo_Res/git/raw/master/20170818234302.png)


![](https://dev.tencent.com/u/fomav/p/Hexo_Res/git/raw/master/20170818234329.png)

如果配置没有问题的话我们这个时候yourname.github.io 应该就可以访问了，可能需要15分钟左右。此时我们的GitHub环境已经配置完毕。

### Hexo环境配置
命令行执行以下两条命令
```
npm install hexo-cli -g
npm install hexo --save
```
检查是否安装成功
```
hexo -v
```
## Hexo部署
新建文件夹指定Hexo的编译目录，在此目录执行命令
```
hexo init
```
然后修改_config.yml中的deploy配置文件和我们的github关联起来

```
deploy:
  type: git
  repo: https://github.com/username(注意修改)/username(注意修改).github.io.git
  branch: master
```
把博客编译成静态文件
```
hexo g
```
部署博客到我们的Github上

```
hexo d
```

如果一切正常的话，我们访问yourname.github.io就可以看到我们的博客已经部署到github上了，我们修改文件后只需要重复运行g命令和d命令就可以上传编译后的文件了，Hexo的使用与修改不再详述。
