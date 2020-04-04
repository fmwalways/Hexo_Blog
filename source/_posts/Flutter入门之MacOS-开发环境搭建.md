---
layout: post
title: Flutter入门之MacOS 开发环境搭建
date: 2019-06-19 14:13:21
tags:
- Flutter
- MacOS
---

距离上一次谷歌开发者大会已经过去了两个月的时间，大会上推出了**Android Q**、**Flutter Web**开发支持以及一些其他方面的东西，作为**Android**开发出身的我**Flutter**产生了极为浓厚的兴趣，**Dart**语言作为**Flutter**开发语言，让我对同样采用此语言**Google**为了万物互联开发的**Fuchsia**系统也充满了期待，于是在空闲时间就开始了此番环境的部署。
<!-- more -->

## 主要步骤
1. 获取Flutter SDK
2. 添加环境变量
3. 完成Flutter依赖配置
4. 新建安装Flutter项目

# 1. 获取Flutter SDK
在**Flutter**官网下载当前平台可用的安装包，我在**Mac**环境下载的是Mac的安装包。 [官网下载链接](https://flutter.dev/docs/development/tools/sdk/releases)

请根据当前平台下载合适的安装包，如果官网链接不可用可以去**Flutter GitHub**项目下载。[GitHub下载链接](https://github.com/flutter/flutter/releases)

# 2. 添加环境变量
解压刚才下载好的安装包并且移动到合适的位置，然后添加**Flutter SDK**环境变量以使用**flutter**命令行
```
export PATH=`Flutter_DIR`/bin:$PATH
```
其中**Flutter_DIR**为**Flutter SDK**所在的文件夹路径，由于众所周知的原因，**Flutter**依赖包服务在中国大陆地区的服务可能不可用，大家也可以添加以下环境变量添加国内镜像源
```
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
```
更改了环境变量文件之后可能需要重启或者注销一下计算机，非即时生效。
# 3. 完成Flutter 依赖配置
如果上面一切正常的话就可以使用**flutter**命令行了，我们可以使用以下命令检查我们的依赖项是否安装完成。
```
flutter doctor
```
如果你像我一样需要同时在**iOS**和**Android**平台开发，那么就要同时装**AndroidStudio**和**XCode**，如果仅仅开发**Android**平台，那么**AndroidStudio**就够了。运行刚才的命令可能会报错，排错还是挺简单的根据提示的内容逐个解决就行了，在这里就不一一赘述。所有依赖成功安装后的提示信息如下。
```
[✓] Flutter (Channel stable, v1.5.4-hotfix.2, on Mac OS X 10.14.5 18F132, locale zh-Hans-CN)
[✓] Android toolchain - develop for Android devices (Android SDK version 28.0.3)
[✓] iOS toolchain - develop for iOS devices (Xcode 10.2.1)
[✓] Android Studio (version 3.4)
[✓] Connected device (1 available)
```
# 4. 新建安装Flutter项目
在合适的文件夹运行以下命令
```
flutter create flutter_app
```
就能创建一个名字为**flutter_app**的**flutter**项目，
这个时候我们插上手机打开**USB**调试或者打开**iOS**、**Android**模拟器运行以下命令行
```
flutter devices
```
如果到类似如下结果
```
2 connected devices:

Android SDK built for x86 • emulator-5554       • android-x86 • Android 9 (API 28) (emulator)
iPhone Xs                 • 7E13B417 • ios      • com.apple.CoreSimulator.SimRuntime.iOS-12-2(simulator)
```
说明手机或者模拟器连接正常，如果没有设备请检查手机连接。
```
flutter run
```
最后我们通过命令行**cd**进入**flutter_app**文件夹，使用**run**命令就可以将**flutter**应用编译在**Android**或者**iOS**设备当中。

