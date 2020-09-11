python

## enumerate()

```
enumerate(sequence, [start=0])
```

### 参数：

- sequence -- 一个序列、迭代器或其他支持迭代对象。
- start -- 下标起始位置。

### 返回值

返回 enumerate(枚举) 对象。

### 样例

```python
>>>seasons = ['Spring', 'Summer', 'Fall', 'Winter']
>>> list(enumerate(seasons))
[(0, 'Spring'), (1, 'Summer'), (2, 'Fall'), (3, 'Winter')]
>>> list(enumerate(seasons, start=1))       # 下标从 1 开始
[(1, 'Spring'), (2, 'Summer'), (3, 'Fall'), (4, 'Winter')]

```

```python
>>>seq = ['one', 'two', 'three']
>>> for i, element in enumerate(seq):
...     print i, element
... 
0 one
1 two
2 three
```

## open

python open() 函数用于打开一个文件，创建一个 **file** 对象，相关的方法才可以调用它进行读写。

```python
open(name[, mode[, buffering]])
```

参数说明：

- name : 一个包含了你要访问的文件名称的字符串值。
- mode : mode 决定了打开文件的模式：只读，写入，追加等。所有可取值见如下的完全列表。这个参数是非强制的，默认文件访问模式为只读(r)。
- buffering : 如果 buffering 的值被设为 0，就不会有寄存。如果 buffering 的值取 1，访问文件时会寄存行。如果将 buffering 的值设为大于 1 的整数，表明了这就是的寄存区的缓冲大小。如果取负值，寄存区的缓冲大小则为系统默认。

###### [菜鸟教程](https://www.runoob.com/python/python-func-open.html)

# 条件语句

## if

```python
if(...):
    comment...


```

# 参数

## 默认参数

```python
def test_defargs(one, two = 2):
   print 'Required argument: ', one
   print 'Optional argument: ', two

test_defargs(1)
# result:
# Required argument: 1
# Optional argument: 2

test_defargs(1, 3)
# result:
# Required argument: 1
# Optional argument: 3
```

## 可变参数

使用`*args`和`**kwargs`语法.。其中，*args是可变的positional arguments列表，**kwargs是可变的keyword arguments列表。并且，*args必须位于**kwargs之前，因为positional arguments必须位于keyword arguments之前。

下面一个例子使用*args，同时包含一个必须的参数：

```python
def test_args(first, *args):
   print 'Required argument: ', first
   for v in args:
      print 'Optional argument: ', v

test_args(1, 2, 3, 4)
# result:
# Required argument: 1
# Optional argument:  2
# Optional argument:  3
# Optional argument:  4
```



下面一个例子使用*kwargs, 同时包含一个必须的参数和*args列表：

```python
def test_kwargs(first, *args, **kwargs):
   print 'Required argument: ', first
   for v in args:
      print 'Optional argument (*args): ', v
   for k, v in kwargs.items():
      print 'Optional argument %s (*kwargs): %s' % (k, v)

test_kwargs(1, 2, 3, 4, k1=5, k2=6)
# results:
# Required argument:  1
# Optional argument (*args):  2
# Optional argument (*args):  3
# Optional argument (*args):  4
# Optional argument k2 (*kwargs): 6
# Optional argument k1 (*kwargs): 5
```

*args和**kwargs语法不仅可以在函数定义中使用，同样可以在函数调用的时候使用。不同的是，如果说在函数定义的位置使用*args和**kwargs是一个将参数pack的过程，那么在函数调用的时候就是一个将参数unpack的过程了。下面使用一个例子来加深理解：

```python
def test_args(first, second, third, fourth, fifth):
    print 'First argument: ', first
    print 'Second argument: ', second
    print 'Third argument: ', third
    print 'Fourth argument: ', fourth
    print 'Fifth argument: ', fifth

# Use *args
args = [1, 2, 3, 4, 5]
test_args(*args)
# results:
# First argument:  1
# Second argument:  2
# Third argument:  3
# Fourth argument:  4
# Fifth argument:  5

# Use **kwargs
kwargs = {
    'first': 1,
    'second': 2,
    'third': 3,
    'fourth': 4,
    'fifth': 5
}

test_args(**kwargs)
# results:
# First argument:  1
# Second argument:  2
# Third argument:  3
# Fourth argument:  4
# Fifth argument:  5
```



# 类

Python 的类提供了面向对象编程的所有标准特性：类继承机制允许多个基类，派生类可以覆盖它基类的任何方法，一个方法可以调用基类中相同名称的的方法。对象可以包含任意数量和类型的数据。和模块一样，类也拥有 Python 天然的动态特性：它们在运行时创建，可以在创建后修改。

## 类的定义
```pyhton
class Student(object):
	pass
```
(object)表示该类从哪个类继承下来的，Object类是所有类都会继承的类。

```python
class MyClass:
    """A simple example class"""
	i=12345
    def f(self):
        return 'hello world'
```

## 类对象

类对象支持两种操作：属性引用和实例化。

### 属性引用

属性引用的标准语法：obj.name,如：MyClass.i和MyClass.f

` MyClass.__doc__ `这也是有效引用，将返回所属类的文档字符串: "A simple example class"


### 实例化

` x=MyClass() `
`__init__`是python中的一个内置方法，可以用来初始化类的状态，实际上就是为了能够给类传入参数。没有`__init__`，就没办法给类传入参数了。

```python
def __init__(self):
    self.data=[]
```

这个可以用来初始化类的状态，实例化时可以不用传入参数。

```python
class Student(object):
	def __inin__(self,name,score):
		self.name=name
		self.score=score
```

`__init__`方法的第一参数永远为`self`，表示类**实例**本身。

定义了`__init__`方法，创建实例时就不能传入空的参数，必须传入与`__init__`方法匹配的参数，但是`self`不需要传，python解释器会自己添加。

```python
student=Student("Hugh",99) #实例化
```

# numpy库

## numpy.fromfile

由一个text或者binary文件创建数组

```python
numpy.fromfile(file, dtype=float, count=-1, sep='', offset=0)
```

- **file** : file or str or Path
	Open file object or filename.
- **dtype** : data-type
	Data type of the returned array. For binary files, it is used to determine the size and byte-order of the items in the file.
- **count** : int
	Number of items to read. `-1` means all items (i.e., the complete file).
- **sep** : str
	Separator between items if file is a text file. Empty (“”) separator means the file should be treated as binary. Spaces (” “) in the separator match zero or more whitespace characters. A separator consisting only of spaces must match at least one whitespace.
- **offset** : int
	The offset (in bytes) from the file’s current position. Defaults to 0. Only permitted for binary files.
