通常情况下,打开 jupyter notebook即从本地地址localhost:8888打开jupyter notebook.
如果希望远程操控jupyter notebook,则需要进行一些设置.
## 1. 检查配置文件是否存在
首相必须确认jupyter notebook 的配置文件```jupyter_notebook_config.py```是否存在.
不同系统的默认配置文件路径如下:
- Windows: ```C:\Users\USERNAME\.jupyter\jupyter_notebook_config.py```
- OS X:```/Users/USERNAME/.jupyter/jupyter_notebook_config.py```
- Linux:```/home/USERNAME/.jupyter/jupyter_notebook_config.py```

如果系统上没有Jupyter 文件夹或者Jupyter 文件夹里没有配置文件,那么必须执行以下命令生成配置文件:
```$ jupyter notebook --generate-config```
这个命令会创建Jupyter文件夹并在文件夹内生成配置文件```jupyter_notebook_config.py```
## 2.生成密码
### 2.1生成访问密码
从 jupyter notebook 5.0 版本开始,我们就可以通过自动方式生成访问密码.
设置访问密码的命令为`jupyter notebook password`，设置后的访问密码存储在`jupyter_notebook_config.json`里面。
```bash
$ jupyter notebook password
Enter password:  ****
Verify password: ****
[NotebookPasswordApp] Wrote hashed password to /Users/you/.jupyter/jupyter_notebook_config.json
```
### 2.2 生成hash密码
如果没有hash密码，那么我们每次通过浏览器远程访问Jupyter时，都需要输入一次密码。如果设置了hash密码，那么我们只需要在首次远程访问jupyter的时候输入一次密码，之后再次访问jupyter的时候就不用重复输入密码了。
在终端输入```ipython```，进入ipython环境后输入下列代码。

```bash
In [1]: from notebook.auth import passwd
In [2]: passwd()
Enter password:
Verify password:
Out[2]: 'sha1:67c9e60bb8b6:9ffede0825894254b2e042ea597d771089e11aed'
```
这里输出的就是hash密码，后面的操作需要用到这个hash密码，所以需要将其复制下来。
输入```exit```退出ipython环境。
## 3.修改配置文件
打开`jupyter_notebook_config.py`文件,可以看到里面很多注释行。如果我们要修改`jupyter_notebook_config.py`里的某一行，必须先把行首的```#```去掉。
找到```#c.NotebookApp.password = ' '```这一行，将注释去掉，并修改为
`c.NotebookApp.password = u'sha1:67c9e60bb8b6:9ffede0825894254b2e042ea597d771089e11aed` '
这里将之前复制的hash密码填入即可，注意密码前面的```u```不可省略，其作用是提示Python编译器，要按照给定的方式来解析引号中的字符串。

```c.NotebookApp.allow_remote_access = True```将默认值False修改为True，表示允许外部访问。
```c.NotebookApp.ip='*'```这里的 *  表示允许所有IP皆可访问
```c.NotebookApp.open_browser = False```禁止自动打开浏览器

```c.NotebookApp.notebook_dir = '/eswai/jupyter'```这里可修改在浏览器打开jupyter notebook后的工作目录。

```c.NotebookApp.port = 9999```设置一个固定的notebook服务会监听的IP端口（这里设置为9999），这个值可以任意，只要保证不和其他已经启用的端口号冲突即可，也可以不修改，默认为8888。

修改完成后在终端输入“jupyter notebook”命令，这样确保Jupyter重新加载jupyter_notebook_config.py，进而使得新配置起效。
之后我们只要在任意浏览器地址栏输入```主机ip：9999```即可远程登录jupyter notebook了。

如果是服务器上docker容器内的jupyter notebook，那么这里必须为宿主机ip:宿主机端口
这里的宿主机端口是创建容器时分配的宿主机端口，比如：-p 8002:9999，那么远程登录地址为宿主机ip:8002。
 
参考文档：

1. [官方英文指南](https://jupyter-notebook.readthedocs.io/en/latest/public_server.html) 

2. [设置 jupyter notebook 可远程访问](https://www.jianshu.com/p/444c3ae23035)

3. [利用Docker环境配置jupyter notebook服务器](https://blog.csdn.net/eswai/article/details/79437428)

4. [如何设置远程访问的Jupyter Notebook服务器-04（服务器篇）](https://zhuanlan.zhihu.com/p/64524822)