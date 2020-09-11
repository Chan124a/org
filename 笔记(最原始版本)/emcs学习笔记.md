[TOC]

# 基础操作

因为 Control 键在 Emacs 中极为常用，所以为了更方便地使用 Emacs 的键位修改，需要 对其做出修改。建议将大写锁定键（Caps Lock）替换为 Control 键。

光标的移动是编辑器中最常用的操作所以必须熟知。

- `C-v`为移动到下一屏，`M-v`为移动到上一屏，`C-l`移动屏幕中心
- `C-f` 为前移一个字符， `f` 代表 forward。
- `C-b` 为后移一个字符， `b` 代表 backward。
- `C-p` 为上移至前一行， `p` 代表 previous。
- `C-n` 为上移至下一行， `n` 代表 next。
- `C-a` 为移至行首， `a` 代表 ahead。
- `C-e` 为移至行尾， `e` 代表 end。
- `M-<`为移动到文件开头，`M->`为移动到文件末尾

常用的文件操作快捷键组合也必须熟记。
- `C-x C-f `为打开目标文件，` f` 代表 find/file

- `C-x C-s `为保存当前缓冲区（Buffer），`s` 代表 save

`C-x `是 Emacs 的快捷键中常用的前缀命令。这些前缀命令常常代表了一系列有关联的指 令，十分重要，请特别牢记。其它常见的还有 `C-c`,` C-h` 。打断组合键为 `C-g` ，它 用于终端取消之前的指令。快捷键就是用预先绑定好的方式告诉 Emacs 去执行指定的命令。 

- `C-u 8 C-f`为向前移动8个字符，`C-u 8 *`将插入8个*
- `C-<spc>`会显示Mark set，可以片选文字
- `C-k`移除行内容。单独的 C-k 会把一行的内容移除，而第二个 C-k 则会移除换行符。 C-u 2
  C-k 会把两行以及它们的换行符移除。
- `C-y`为粘贴。在用 C-y 召回最近移除的文字之后，紧接着再按 M-y 就可以召回再前一次被移除的内容，再按一次 M-y 又可以召回再上一次的……你可以给M-y指定一个数字参数
- `C-/ 、 C-_ 和C-x u`都是撤销操作
- ` C-x C-b  ` 列出缓冲区,`C-x b TUTORIAL.cn`可以返回缓冲区TUTORIAL.cn
- `C-x C-s`保存缓冲区文件，` C-x s`保存所有缓冲区文件
- `C-z` 可以暂时离开 Emacs,·`C-x C-c`可以提出emacs
- `M-x replace-string`可以替换
- `M-x recover file`可以恢复自动保存文件。自动保存文件的文件名首尾都有一个#
- `M-x 主模式`可以切换主模式，默认为Fundamental
- `C-s `向前搜索，`C-r`向后搜索
- `C-M-v`可以对第二窗格翻页，`C-M-S v`是第二窗格向上翻页
- 连续使用`C-x o`可以遍历所有窗格
- `C-x 4 C-f`，紧跟着输入一个文件名，再用 <Return> 结束，可以在一个新开窗格里打开文件。
- `M-x make-frame`可以新建一个窗格， `M-x delete-frame`可以关闭选中的窗格
- `ESC ESC ESC`可以离开递归编辑，这是一个最通用的离开命令
- `C-h c C-p`可以查看`C-p`命令的简要解释，`C-h k C-p`可以查看详细说明
- `M-x auto-fill-mode`启动自动折行模式。再用一次这条命令，自动折行模式会被关闭
- 

# 内置功能

Emacs 功能强大，但是部分功能默认情况下并未开启。下面就有几个例子，

编辑器内显示行号可使用 `M-x linum-mode` 来开启。

**获取帮助**

Emacs 是一个富文档编辑器（Self document, extensible editor）而下面的三种方法在学 习 Emacs 的过程中也非常重要。他们分别是，

- `C-h k` 寻找快捷键的帮助信息
- `C-h v` 寻找变量的帮助信息
- `C-h f` 寻找函数的帮助信息
- `C-h a`相关命令搜索

比如按：`C-h k C-x C-s可以查看`C-x C-s`的介绍

![image-20191228100929385](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20191228100929385.png)

这里可以看到，`C-x C-f`就是给emacs发送`save-buffer`命令

我们可以直接`M-x save-buffers`执行保存命令。

所以快捷键其实就是一种特殊的调用命令的方式。


# lisp语法

参考[X分钟速成Y](https://learnxinyminutes.com/docs/zh-cn/elisp-cn/)
```
(+ 2 2)  ;;2+2,s式
(+ 2 (+ 1 1))  ;;2+(1+1),s式可以嵌套
;;把光标移到闭括号后，按下C-j就会输出结果
;;C-x C-e则会在emacs最底部显示结果

(setq my-name "Bastien")  ;; setq可以将一个值赋给一个变量
(setq list-of-names '("Sarah" "Chloe" "Mathilde")) ;;将一些字符串存到列表中

(car list-of-names)  ;; 用 `car'来取得第一个字符串：
(cdr list-of-names)  ;; 用 `cdr'取得剩下的所有字符串:


(insert "Hello!")  ;; insert会在光标处插入字符串
(insert "Hello" " world!") ;;可同时插入多个字符串

(defun hello () (insert "Hello, I am " my-name))  ;;定义了一个没有接受参数的函数
(hello)  ;;执行函数
(defun hello (name) (insert "Hello " name))  ;;定义了接受一个参数的函数
(hello "you") ;;执行函数
;;这里需要注意的是,定义函数后必须在函数最后面的括号之后按下C-x C-e才能编译函数,否则这个函数定义是没有作用的.

(switch-to-buffer-other-window "*test*") ;;在新的窗口中新建一个名为 "*test*" 的buffer,执行后光标位于*test* buffer内

(progn
  (switch-to-buffer-other-window "*test*")
  (hello "you")
  (other-window 1))
  ;;progn命令可将s式结合起来,(other-window 1)可以让执行后命令后的光标保持在第一个窗口里
  
 (let ((local-name "you"))
    (switch-to-buffer-other-window "*test*")
 	(erase-buffer)
 	(hello local-name)
	(other-window 1))
;;  let将一个值和一个局部变量绑定,并且let也可以像progn那样将很多s式组合起来.

(format "Hello %s!\n" "visitor") ;;格式化字符串的方法

(read-from-minibuffer "Enter your name: ") ;;用于接受用户输入信息

(push "Stephanie" list-of-names)  ;; 用 push把字符串添加到列表的开头
(mapcar 'hello list-of-names)  ;;对list-of-names列表中的每一个元素都使用hello函数

(goto-char (point-min) ;;将光标移到buffer的开始

(while (search-forward "Hello")
      (replace-match "Bonjour"))
;; (while x y) 当x返回某个值时执行y这个s式,

(search-forward "Hello") ;;查找字符串"Hello"
(search-forward "Hello" nil t) ;;nil'参数的意思是 : 查找并不限于某个范围内,t'参数的意思是: 当什么都没找到时，不给出错误提示"Search failed: Hello"
(re-search-forward "Bonjour \\(.+\\)!" nil t)  ;;用这个命令可以查找一个模式，即正则表达式

(add-text-properties (match-beginning 1)
                           (match-end 1)
                           (list 'face 'bold))
;;add-text-properties可以添加文字属性, 比如文字样式

(setq my-name "cpd")
(defun my-func()
  (interactive)
  (message "hello,%s" my-name))
(my-func)
(global-set-key (kbd "<f3>") 'my-func)
;;message 相当于print
；；interactive是的可以用`M-x`调用自定义函数
；;最后一行是设置函数快捷键为f3


;; 如果你想对一个变量或者函数有更多的了解：
;; C-h v 变量 回车
;; C-h f 函数 回车
;; 阅读Emacs Lisp官方文档:
;; C-h i m elisp 回车
```
# emacs配置文件

Emacs 的配置文件默认保存在 `~/.emacs.d/init.el` 文件中。（如果其不存在可自行创建， 配置文件也可保存在 `~/.emacs` 文件中，他们之间的区别我们会在后面做讨论）

**注意：** 如果希望把配置放在 `~/.emacs.d/init.el` 文件中，那么需要手工删除 `~/.emacs` 文件。

在开始配置之前让我们先来区别 Emacs 中 Major Mode 与 Minor Mode 的区别。Major Mode 通常是定义对于一种文件类型编辑的核心规则，例如语法高亮、缩进、快捷键绑定等。 而 Minor Mode 是除去 Major Mode 所提供的核心功能以外的额外编辑功能（辅助功能）。 例如在下面的配置文件中 `tool-bar-mode` 与 `linum-mode` 等均为 Minor Mode。

简单来说就是，一种文件类型同时只能存在一种 Major Mode 但是它可以同时激活一种或多 种 Minor Mode。如果你希望知道当前的模式信息，可以使用 `C-h m` 来显示当前所有开启 的全部 Minor Mode 的信息。

## 简单的编辑器自定义

下面是一些简单的编辑器配置信息，你需要做的就是将其写入你的配置文件中 （ `~/.emacs.d/init.el` ）即可。

```
;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode 1)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq cursor-type 'bar)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 关闭缩进 (第二天中被去除)
;; (electric-indent-mode -1)

;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 160)

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)
```

## 插件管理

使用默认的插件管理系统（可在菜单栏 `Options > Manage Emacs Packages` 中找到）安 装 [Company](http://company-mode.github.io/) 插件，他是一个用于代码补全的插件。它的名字代表补全一切的意思（ **Comp** lete **Any** thing）。因为默认的插件管理系统提供的插件十分有限，所以我们会在之后的 几天中继续将其强化。

`M-x company-model`可以启用Company插件

使用的下面的配置将 Company-mode 在全局模式下激活

```
; 开启全局 Company 补全
(global-company-mode 1)
```

## Org-mode

简单的 Org-mode 使用，它可以列出提纲，并方便地使用 `tab` 键来对其进行展开与关闭。
`C-c C-t` 可以将一个条目转换成一条待办事件。

```
* 为一级标题
** 为二级标题
*** 为三级标题并以此类推
```

## HOME
HOME是一个变量.```c-x d ~ RET```，编辑区域左上角的文件路径即emacs的HOME
emacs会在HOME路径下查找.emacs.d文件夹,并加载其中的init.el配置文件.我们可以在通过修改init.el文件(初次使用emacs可以自行创建)的内容,让emacs加载任意位置的配置文件.
用任意编辑器打开$home$/.emacs.d/路径下的init.el文件
在首行添加命令

```
(setenv "HOME" "C:/Users/123/AppData/Roaming/");;路径位置可以任意修改
(load "~/.emacs.d/init.el");;用于加载配置文件init.el
```
```setenv```用于设置环境变量.与set的最大区别为: ```set```变量只对当前进程有效，不会传递给子进程而```setenv```变量不仅对当前进程有效，而且会传递给子进程. 当同时使用```set```和```setenv```设置一个变量时，当前进程中，会优先使用```set```设置的值

emacs的插件通常会被.emacs.d文件夹下面。当我们更换电脑时,只需要把整个文件夹复制过去,并加载原有的配置文件即可.

## PATH以及exec-path
当从一个shell打开emacs时,emacs会继承（拷贝）环境变量PATH.在emacs中修改变量PATH并不会同时修改系统的环境变量PATH.
可通过S式```(getenv "PATH")```或者`M-x getenv RET PATH`查看PATH.
emacs拥有一个名为```exec-path```的变量.```exec-path```的值是包含目录路径的一个列表.
默认情况下,emacs将变量PATH的值复制到```exec-path```里,所以这两个变量的值是相同的.
PATH和exec-path的不同之处在于:
- 在emacs里运行shell时,emacs会使用PATH
- 当emacs查找其功能所需要的程序时(例如拼写检查、文件压缩等等)，emacs会使用```exec-path```
当在emacs输入```M-x python```时，emacs会在```exec-path```中搜索python并执行，之后emacs就进入了python模式。
PATH和```exec-path```的同步修改方法可参考[这里](http://ergoemacs.org/emacs/emacs_env_var_paths.html)
## 加载
emacs 24以上的版本都拥有一个插件管理器```elpa```,可以通过```M-x list-packages```安装插件。
emacs 的插件一般称为“package”或者“library”,实际上运行插件就是在运行脚本。
加载相关指令说明：
- ```load```一个文件，即执行该文件里所有elisp指令。
- Feature：feature（单数形式）一般对应一个插件的名字；featurs（复数形式）是一个存储feature的列表。通常，一个插件的启动脚本的结尾会调用```(provide '<symbol name>)```，将```'<symbol name>```加到feature中去。```'<symbol name>```一般就是插件的名字。
- `(require '<symbol name>)`会先查看features里面是否存在`<symbol name>`。如果存在，语句执行完毕。如果不存在，基于它来猜一个文件名，或者由`require`的第二个参数直接指定文件名，然后`load`文件。注意，`load`完成后，`require`函数会再一次查看features列表中是否存在`'<symbol name>`，如果发现还是不存在，视参数`<soft-flag>`来决定是否报错
- `require`的意义在于避免重复加载。比如，某个插件的启动脚本中需要用到另一个插件提供的某个函数。那么它就会`require`这个插件，保证插件已被载入，然后再执行后续语句。
- `load`会搜索`load-path`，`load-file`需要指定文件路径，`autoload`在一个函数被call后再`load`指定文件
- ```autoload```告诉emacs某个地方有一个定义好的函数，并且让emacs调用该函数的时候再去加载函数。
emacs的内置插件位置在```F:\emacs-26.3-x86_64\share\emacs\26.3\lisp```里。后缀为```.el```的文件是脚本文件，后缀为```.elc```的文件为脚本编译后的文件。emacs会优先加载``.elc```的文件，只有`.elc`文件不存在才会加载`.el`文件
## Elpa

在emacs24和更高的版本中，elpa是一个内置插件，脚本文件`package.el`位于emacs安装路径`\share\emacs\24.4.91\lisp\emacs-lisp`。
1. 插件的默认安装路径是`~/.emacs.d/elpa`

2. 按下`M-x list-packages`即可调用```elpa```

3. 由于在启动时只是注册函数名，所以elpa的启动脚本并未加载。如果你想在配置文档中修改脚本中定义的变量，比如`package-archives`，请先`(require 'package)`。该原则适用于其他插件的配置。也就是说，如果你想在`init.el`中修改某个插件的某个变量的值，请保证emacs在执行这条修改语句时，相关变量已经得到定义

4. 一般用来初始化该插件的主脚本的文件名都是`插件名.el`

# 高级自定义

## 说在最前面

如果你想深入学习 Emacs Lisp 可以阅读 GNU 提供的 [An Introduction to Programming in Emacs Lisp](https://www.gnu.org/software/emacs/manual/html_mono/eintr.html) 。（也可以 `M-x info` 然后选择 Emacs Lisp Intro）

我们先解决前一天中遇到的一些问题。首先是在对象是一个缓冲区局部变量（Buffer-local variable）的时候，比如这里的 `cursor-type` ，我们需要区分 `setq` 与 `setq-default` ： `setq` 设置当前缓冲区（Buffer）中的变量值， `setq-default` 设 置的为全局的变量的值（具体内容可以在 [StackOverflow 找到](http://stackoverflow.com/questions/18172728/the-difference-between-setq-and-setq-default-in-emacs-lisp)）。下面是一个例子，用于 设置光标样式的方法。

```
(setq-default cursor-type 'bar)
```

今天我们需要将第一天关闭的自动缩进 (`electric-indent-mode`) 从配置文件中去除，它 是 Emacs 24.4 中加入的新特性，你可以在这篇[文章](http://emacsredux.com/blog/2014/01/19/a-peek-at-emacs-24-dot-4-auto-indentation-by-default/)中找到更多关于它的内容。我们之前关 闭它是因为，它存在不理想的缩进效果（在 Emacs Lisp 中用分号做注释时 `fancy-comment` 会造成很远的缩进，其实解决方法是使用 Emacs Lisp 推荐的两个分号而 不是一个 `;;` ，这样就可以避免这个问题。于是我们也就将其从配置文件中删除）

因为通常我们的配置文件以及项目文件均使用版本控制系统，所以自动生成的备份文件就显 得有些多余。我们还可以禁止 Emacs 自动生成备份文件，例如 `init.el~` 。（ `~` 为后 缀的文件为自动生成的备份文件）我们可以使用下面的方法将其关闭。

```
(setq make-backup-files nil)
```

关于分屏的使用，如果你已经读过 Emacs 自带的教程，现在你应该已经掌握了基本的分屏 操作方法了。关于分屏的更多内容你可以在[这里](https://www.gnu.org/software/emacs/manual/html_node/emacs/Split-Window.html)找到。

- `C-x 1` 仅保留当前窗口
- `C-x 2` 将当前窗口分到上边
- `C-x 3` 将当前窗口分到右边

使用下面的配置来加入最近打开过文件的选项让我们更快捷的在图形界面的菜单中打开最近 编辑过的文件。

```
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;; 这个快捷键绑定可以用之后的插件 counsel 代替
;; (global-set-key (kbd "C-x C-r") 'recentf-open-files)
```

`require` 的意思为从文件中加载特性，你可以在杀哥的网站读到关于 Emacs Lisp 库系统 的更多内容，文章在[这里](http://ergoemacs.org/emacs/elisp_library_system.html)。

`M-x eval-buffer`可以执行整个buffer的命令。

使用下面的配置文件将删除功能配置成与其他图形界面的编辑器相同，即当你选中一段文字 之后输入一个字符会替换掉你选中部分的文字。

```
(delete-selection-mode 1)
```

下面的这些函数可以让你找到不同函数，变量以及快捷键所定义的文件位置。因为非常常用 所以我们建议将其设置为与查找文档类似的快捷键（如下所示），

- `find-function` （ `C-h C-f` ）
- `find-variable` （ `C-h C-v` ）
- `find-function-on-key` （ `C-h C-k` ）

在我们进入下一个部分之间让我们来看看使用 `~/.emacs.d/init.el` 与 `~/.emacs` 的区 别（更多关于他们区别的讨论可在[这里](http://emacs.stackexchange.com/questions/1/are-there-any-advantages-to-using-emacs-d-init-el-instead-of-emacs)找到）。简单来说请使用前者，因为它有下面的两个 优点，

- 它可以更好将所有 Emacs 相关的文件整合在一个目录内（干净的 `HOME` ，网盘备份等优点）
- 更好的版本控制

## Emacs 也很美

### 配置插件源

在进行美化之前我们需要配置插件的源（默认的源非常有限），最常使用的是 [MELPA](https://melpa.org/) （Milkypostman’s Emacs Lisp Package Archive）。它有非常多的插件（3000 多个插件）。 一个插件下载的次数多并不能说明它非常有用，也许这个插件是其他的插件的依赖。在[这里](https://melpa.org/#/getting-started) 你可以找到其安装使用方法。添加源后，我们就可以使用 `M-x package-list-packages` 来查看所有 MELPA 上的插件了。在表单中可以使用 `I` 来标记安装 `D` 来标记删除， `U` 来更新，并用 `X` 来确认。

你可以直接将下面的代码复制到你的配置文件顶端，从而直接使用 Melpa 作为插件的源。 你可以将你需要的插件名字写在 `my/packages` 中，Emacs 在启动时会自动下载未被安装 的插件。

```
 (when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

 ;; cl - Common Lisp Extension
 (require 'cl)

 ;; Add Packages
 (defvar my/packages '(
                ;; --- Auto-completion ---
                company
                ;; --- Better Editor ---
                hungry-delete
                swiper
                counsel
                smartparens
                ;; --- Major Mode ---
                js2-mode
                ;; --- Minor Mode ---
                nodejs-repl
                exec-path-from-shell
                ;; --- Themes ---
                monokai-theme
                ;; solarized-theme
                ) "Default packages")

 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
           when (not (package-installed-p pkg)) do (return nil)
           finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
         (package-install pkg))))

 ;; Find Executable Path on OS X
 (when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))
```

关于上面这段配置代码有几个知识点，首先就是这段配置文件中用到了 `loop for ... in` ，它来自 `cl` 即 Common Lisp 扩展。 `for` , `in`, `collect` 均为 `cl-loop` 中的 保留关键字。下面是一些简单的 `cl-loop` 的使用示例：

```
;; 遍历每一个缓冲区（Buffer）
(cl-loop for buf in (buffer-list)
         collect (buffer-file-name buf))

;; 寻找 729 的平方根（设置最大为 100 为了防止无限循环）
(cl-loop for x from 1 to 100
         for y = (* x x)
         until (>= y 729)
         finally return (list x (= y 729)))
```

你可以在[这里](http://www.gnu.org/software/emacs/manual/html_mono/cl.html#Loop-Facility)找到更多关于循环的使用说明。

其次就是它使用到了 `quote`, 它其实就是我们之前常常见到的 =’= （单引号）的完全体。 因为它在 Lisp 中十分常用，所以就提供了简写的方法。

```
;; 下面两行的效果完全相同的
(quote foo)
'foo
```

`quote` 的意思是不要执行后面的内容，返回它原本的内容（具体请参考下面的例子）

```
(print '(+ 1 1)) ;; -> (+ 1 1)
(print (+ 1 1))  ;; -> 2
```

更多关于 `quote` 的内容可以在[这里](https://www.gnu.org/software/emacs/manual/html_node/elisp/Quoting.html)找到，或者在[这里](http://stackoverflow.com/questions/134887/when-to-use-quote-in-lisp)找到 StackOverflow 上对于它的讨论。

这样我们就可以区分下面三行代码的区别，

```
;; 第一种
(setq package-selected-packages my/packages)
;; 第二种
(setq package-selected-packages 'my/packages)
;; 第三种
(setq package-selected-packages (quote my/packages))
```

第一种设置是在缓冲区中设置一个名为 `package-selected-packages` 的变量，将其的值 设定为 `my/packages` 变量的值。第二种和第三种其实是完全相同的，将一个名为 `package-selected-packages` 的变量设置为 `my/packages` 。

我们可以用下面代码将 Emacs 设置为开启默认全屏，

```
(setq initial-frame-alist (quote ((fullscreen . maximized))))
```

我们也可以启用自动括号匹配（Highlight Matching Parenthesis），随后会介绍插件来增 强这个匹配的功能。你可以在[这里](https://www.gnu.org/software/emacs/manual/html_node/emacs/Hooks.html)读到关于钩子的更多信息。

```
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
```

高亮当前行，当文本内容很多时可以很容易找到光标的位置。

```
(global-hl-line-mode 1)
```

### 安装主题

```
(add-to-list 'my/packages 'monokai-theme)
```

`M-x load-theme'可以加载主题

然后使用下面的配置使其每次打开编辑器时加载主题，

```
(load-theme 'monokai 1)
```

### 推荐插件

- [company](http://company-mode.github.io/)
- [hungry-delete](https://github.com/nflath/hungry-delete)，用于一次删除大量空格
- [Smex](https://github.com/nonsequitur/smex) (如果你使用 Counsel 来增强你的 `M-x` ，那么就不需要再安装 Smex 了)
- [Swiper & Counsel](https://github.com/abo-abo/swiper)
- [smartparens](https://github.com/Fuco1/smartparens)

使用 `M-x customize-group` 后选择对应的插件名称，可以进入可视化选项区对指定的插 件做自定义设置。当选择 Save for future session 后，刚刚做的设计就会被保存在你的 配置文件（ `init.el` ）中。关于各个插件的安装与使用方法通常都可以在其官方页面找 到（GitHub Pages 或者是项目仓库中的 README 文件）。我们强烈建议大家在安装这些插 件后阅读使用方法来更好的将它们使用到你的日常工作当中使效率最大化。

## JavaScript IDE

Emacs 提供的默认 JavaScript Major Mode 并不是非常好用。所以我们可以将默认的模式 替换成 [js2-mode](https://github.com/mooz/js2-mode) 一个比默认模式好用的 Major Mode。我们可以通过 MELPA 来下载它，然 后用下面的代码将其启用。

```
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))
```

你可以在[这里](https://www.gnu.org/software/emacs/manual/html_node/elisp/Auto-Major-Mode.html)（How Emacs Chooses a Major Mode）找到 Emacs 是如何选择何时该选用何 种 Major Mode 的方法。

在这里我们需要知道 `auto-mode-alist` 的作用，这个变量是一个 [AssociationList](https://www.emacswiki.org/emacs/AssociationList)，它 使用正则表达式（REGEXP）的规则来匹配不同类型文件应使用的 Major Mode。 下面是几个 正则表达式匹配的例子，

```
(("\\`/tmp/fol/" . text-mode)
 ("\\.texinfo\\'" . texinfo-mode)
 ("\\.texi\\'" . texinfo-mode)
 ("\\.el\\'" . emacs-lisp-mode)
 ("\\.c\\'" . c-mode)
 ("\\.h\\'" . c-mode)
 …)
```

下面是如何添加新的模式与对应文件类型的例子（与我们配置 `js2-mode` 时相似的例子），

```
(setq auto-mode-alist
  (append
   ;; File name (within directory) starts with a dot.
   '(("/\\.[^/]*\\'" . fundamental-mode)
     ;; File name has no dot.
     ("/[^\\./]*\\'" . fundamental-mode)
     ;; File name ends in ‘.C’.
     ("\\.C\\'" . c++-mode))
   auto-mode-alist))
```

在 `js2-mode` 模式中会提供

- 语法高亮
- 语法检查器（Linter）

执行缓冲区的代码可以使用 `nodejs-repl` 插件，它需要你的机器上已经安装了 NodeJS。 然而在 Mac OS X 上可能会出现找不到 NodeJS 可执行文件的问题，要解决这个问题你需要 安装另外一个 `exec-path-from-shell` 的插件并将其启用。

```
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
```

有了 `nodejs-repl` 我们就可以方便的测试和开发我们的 JavaScript 代码了（你可以在 [这里](https://github.com/mooz/js2-mode)找到更多关于它的使用方法）。

## Org-mode 进阶

在 Org-mode 中你可以直接开启新的缓冲区（Buffer）直接用相应的 Major Mode 来编辑代 码块内的内容。在代码块中使用 C-c ‘ 会直接打开对应模式的缓冲区（不仅限于 Lisp）。 这样就使在 Org-mode 中编辑代码变的十分方便快捷。

使用 `<s` 然后 Tab 可以直接插入代码块的代码片段（Snippet），更多类似的代码片段 （Org-mode Easy Templates）可以在[这里](http://orgmode.org/manual/Easy-Templates.html)找到。

```
#+BEGIN_SRC emacs-lisp
  ;; Your code goes here
  ;; 你的代码写在这里
#+END_SRC
```



### Agenda 的使用

```
;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files '("~/org"))

;; 设置 org-agenda 打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)
```

你只需将你的 `*.org` 文件放入上面所指定的文件夹中就可以开始使用 Agenda 模式了。

- `C-c C-s` 选择想要开始的时间
- `C-c C-d` 选择想要结束的时间
- `C-c a` 可以打开 Agenda 模式菜单并选择不同的可视方式（ `r` ）

# 问题集锦
## emacs中文环境下的卡顿问题
### 解决方法1
Options->Set Default Font->选择宋体,即可解决问题
### 解决方法2
 配置文件中添加
 ```
 (setq inhibit-compacting-font-caches t)
 ```
 ### 解决方法3
 参考[升级到了win10，中文字体只能用宋体，其他所有中文字体都卡](https://emacs-china.org/t/topic/2900/15)d