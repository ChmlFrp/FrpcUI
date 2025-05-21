# FrpcUI

  该项目的UI框架来源于https://github.com/Jeyderht/UIKitTutorials 并基于ChmlFrp的API进行二次开发；

# 代码内容

  这是一个面向AI编程的项目，代码内容来自DeepSeek，运行时需要安装.NET运行库

# 主要功能
  
  1、主页用户信息，创建隧道，获取隧道信息，删除隧道，获取配置列表并可自动将配置写入Frpc的.ini配置文件

  ![登录](/Images/Login.png) ![主页](/Images/Home.png)

  2、写入配置文件后可通过主页的运行按钮开始运行

  ![隧道列表](/Images/Tunnel.png) ![配置文件](/Images/Config.png)

  3、后续将使用腾讯云的API进行域名管理页面的开发，实现节点掉线自动切换隧道并自动将域名解析到对应的节点
