[TOC]



## pip的用法

```
sudo pip3 --no-cache-dir --default-timeout=100 install -i https://pypi.tuna.tsinghua.edu.cn/simple torch
```

--no-cache-dir：pip下载库时会占用缓存，当文件过大会导致错误，这个选项可以避免该错误。

```
pip install -r requirements.txt
```

-r表示从requirements.txt读取安装列表

浙大内部镜像：http://mirrors.aliyun.com/   

## 远程主机
	#互传文件
​	scp 本地用户名@IP地址:文件名1 远程用户名@IP地址:文件名2 
​	#[本地用户名@IP地址:]可以不输入
​	scp -r file username@ip:filepath #参数-r用于传文件夹

## conda的用法
### 增加源
​    conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
​    

    conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
    
    conda config --set show_channel_urls yes
    
    onda create -n siammask python=3.6 #创建名为siammask的环境，指定python版本为3.6
    source activate siammask  #启用环境，第二次启用不用再创建环境
    conda deactivate  #退出环境

glob模块可以查找符合特定规则的文件路径名。

	# -*- coding: UTF-8 -*- 或者 # coding=utf-8 
	#Python中默认的编码格式是 ASCII 格式，在没修改编码格式时无法正确打印汉字，所以在读取中文时会报错。

## apt-get的用法
### apt-get修改源
​	

```
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak 
```


​	#sources.list是包管理工具apt所用的记录软件包仓库位置的配置文件，同样类型的还有位于 同目录下sources.list.d文件下的各种.list后缀的各文件。

# 虚拟机
NAT模式下，多个虚拟机都是连接到同一个网关地址

## ubuntu终端放大缩小
<Ctrl> + <->减小字号
<Ctrl> + <Shift> + <+>增大字号
终端设置
1、打开终端；
2、Edit→Profile Preferences
3、在General里最后一行设置默认大小

Ubuntu快速安装模式中，root用户默认不设置密码，可执行下面的命令为root设置密码

    sudo passwd