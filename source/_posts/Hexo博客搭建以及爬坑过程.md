---
title: Hexo博客搭建以及爬坑过程
date: 2017-02-13 19:36:53
tags:
 - Hexo
 - 博客
---

### 序言

此篇博客讲述了我从构想搭建博客以及搭建过程中遇到的问题以及爬坑教程
<!-- more -->

#### 一、构想和规划

大概16年11月份时候，那个时候在找工作，平常的时候就写一些代码什么的，在网上翻录别人博客的时候心里就在想什么时候能有个自己私人的博客，这个想法越来越不可收拾，心里一想，那就搞呗。于是乎这篇博文就这样诞生了。大概前前后后历经3个月的时间吧，从服务器到域名，由于用的国内的域名以及DNS，免不了备案一番，其实真正花在这个时间也不多，总的算下来也就几天的时间。停摆一阵弄一阵，看到现在的多域名全站https的博客，回头过来不免感慨一番，现在想想还是挺有意思的一件事情。

#### 二、服务器的选择

一开始选择服务器的时候自己没有想那么多，就想着省事能用就行，基于这样的想法就想着用国内的服务器就行了，后面的备案着实的坑了我一下。当时什么也不懂，觉得阿里的服务器挺好，加上新会员优惠活动，就入手了阿里的云服务器。入手之后就考虑域名的问题了，后来一想，既然搞了就搞一起吧，就在万网买了2个域名。

#### 三、开始搭建博客

之前采用的方案是httpd + wordpress的方式搭建了一个博客，达不到想要的效果，现在采用的方式是nginx + Hexo 没有启动Hexo服务，仅仅把Hexo生成的静态目录文件部署到nginx目录当中，Windows上编辑markdown文件push到git仓库触发服务器上面的钩子达到自动同步编译的过程，这个后面会讲到。

OK，Lest's Begin~ 本次教程服务器系统环境为Centos6.5，客户端系统为Win10

- 安装node.js

此环境Windows也需安装部署

```
yum install -y nodejs

```

测试是否安装成功
```
[root@iZuf6g6ve7f9a6w9suivvjZ ~]#node -v
v4.7.2
[root@iZuf6g6ve7f9a6w9suivvjZ ~]#npm -v
2.15.11

```

- Windows部署Hexo环境
```
npm install hexo-cli -g

```

- 生成本地Hexo项目

在客户端新建Blog文件夹，初始化Hexo项目并安装拓展，检查是否成功
```
hexo init blog
cd blog
npm install
hexo server
```

如果没有问题，可在客户端打开localhost:4000查看效果

- 新建一篇文章
```
hexo new "My First Post"
hexo server
```

在/source/_posts目录中生成了刚才文件名的md文件，我们写博客就编辑这个文件，写完了编译即可。

- 提交代码托管

因为GitHub私人项目需要收费，我使用的是国内的[Coding.net](https://coding.net)，新建一个Hexo项目，配置ssh公钥和私钥，使用SSH地址提交代码比较方便一些，服务器需要配置Git，Nignx，安装这两个比较容易，不再赘述。
将客户端Hexo目录提交到Git仓库
```
Git init
Git remote add origin git@git.coding.net:fmwcn/Hexo_Blog.git
Git add .
Git commit -m "first commit"
Git push origin master
```

- 服务器拉取仓库代码

服务器也需要配置ssh才能使用ssh地址，在这里我直接放进根目录
```
mkdir hexo
git init
git remote add origin git@git.coding.net:fmwcn/Hexo_Blog.git
git pull origin master
```
- Centos部署Hexo
```
cd ~/hexo
npm install hexo-cli -g
npm install
```
- Hexo静态编译
```
hexo g
```

会在hexo目录中生成public目录，只需要将此目录放进nginx目录中就可以了

- GitWebHooks自动化部署

现在的流程是，我们在客户端写好文件，登陆服务器git pull然后编译一下，如何完成我们的自动化部署呢？
Git仓库为我们提供了WebHooks来监控我们的仓库状态，这样我们可以设置当我们客户端Push的时候就会触发我们设定的事件。
实现WebHooks自动化部署的推荐条件：
服务器端配置ssh认证
服务器端配置nodejs服务，接收Coding发来的请求

- 配置WebHooks

![](https://raw.githubusercontent.com/fmwalways/Hexo_Res/master/20170213211059.png)

如图所示：当仓库发生push的时候，会发送一个http请求[http://fomav.com:4002/webhooks/push/master](http://fomav.com:4002/webhooks/push/master)，我们在服务器处理这个请求就可以了。

在hexo目录中新建webhooks.js文件
```
var http = require('http')
var exec = require('child_process').exec

http.createServer(function (req, res) {
// 该路径与WebHooks中的路径部分需要完全匹配，实现简易的授权认证。
if(req.url === '/webhooks/push/master'){
// 如果url匹配，表示认证通过，则执行 sh ./deploy.sh
exec('sh ./deploy.sh')
}
res.end()
}).listen(4002)

```
新建一个deploy.sh脚本
```
git pull origin master
hexo g
```

安装pm2
```
npm install -g pm2
pm2 start webhooks.js
```

至此客户端push文章的时候服务器就会自动部署。
