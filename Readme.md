# iLearnOL

[![Build Status](https://travis-ci.org/mtianyan/hexoBlog-Github.svg?branch=master)](https://travis-ci.org/mtianyan/hexoBlog-Github)
[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)

- 仿照[慕课网](http://www.imooc.com/)搭建的在线编程学习平台

## 演示页

演示地址：http://193.112.138.50

## 功能

![现功](https://github.com/markWUparticle/iLearnOL/blob/master/%E5%AE%9E%E7%8E%B0%E5%8A%9F%E8%83%BD.jpg)

​	分析网页需求，采用模块分割降低耦合思想，将主要功能分为Users、Courses、Operation、Organization四个模块。重写admin，集成了 Xadmin框架完善了ORM后台管理系统，可以进行权限的管理，整合了富文本插件。前端使用模板继承来完成，同时用ajax异步请求完成收藏、咨询等功能。在CentOS7下使用Nginx+Uwsgi部署Django应用，使用 Sentry 对 Django 程序进行 Bug 监控报警、和追踪管理 。

## 使用说明

### 项目依赖

- python 3.6
- Django 2.0
- Xadmin 0.6
- MySQL 5.7

### 快速运行

```
$ git clone https://github.com/markWUparticle/iLearnOL
$ cd iLearnOL
$ pip install -r requirements.txt
$ 创建数据库ilearnol
$ python manage.py makemigrations
$ python manage.py migrate
$ python manage.py runserver  
```

打开链接<http://127.0.0.1:8000/>

###

