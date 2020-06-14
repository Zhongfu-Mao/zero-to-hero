# HTML5

[官方标准](https://html.spec.whatwg.org/multipage/)

> HTML5是W3C和WHATWG合作的结晶
> W3C: World Wide Web Consortium
> WHATWG: Web Hypertext Applications Technology Working Group

`header`, `aside`, `nav`, `footer`这类的标签并不是HTML5工作组想出来的，也不是W3C提出来的，而是谷歌根据大数据分析用户习惯得出来的

## ID与class

> W3C建议，对于页面关键的结构或者大结构，我们才使用id。所谓的关键结构，指的是诸如LOGO、导航、主体内容、底部信息栏等结构。对于一些小地方，还是建议使用class属性。  
> 一般用一个class抽取公共样式，然后用另外一个class定义单独样式。  

## 豆知识

### 浏览器标题栏小图标

```html
<link rel="shortcut icon" type="image/x-icon" href="favicon.ico"/>
```

> favicon是Favorites Icon的缩写，favicon.ico是指显示在浏览器收藏夹、地址栏和标签标题前面的个性化图标。  
> favicon.ico一般应是16×16的1个256色的图标。  
> 可以通过photoshop生成ico文件，也可以利用网上的在线生成工具[例如](http://www.ico.la/)  
> rel和type属性是固定形式, href属性是小图标的地址

## 语义化

### 标题语义化

1. 一个页面只能有一个h1标签。
2. h1～h6之间不要断层。
3. 不要用h1～h6来定义样式。
4. 不要用div来代替h1～h6。

### 图片语义化

1. alt属性与title属性 -> alt是必须属性,要添加必要的描述信息
2. figure元素和figcaption元素 -> figure元素用于包含图片和图注，figcaption元素用于表示图注文字。

### 表格语义化

|  标签   |      说明      |
| :-----: | :------------: |
|  table  |      表格      |
| caption |      标题      |
|  thead  | 表头(语义划分) |
|  tbody  | 表身(语义划分) |
|  tfoot  | 表尾(语义划分) |
|   tr    |       行       |
|   th    |   表头单元格   |
|   td    |   表格单元格   |

### 表单语义化

* label标签

```html
<label for="<关联的表单元素的ID>">说明性文字</label>
```

label标签的for属性有两个作用。
1.语义上绑定了label元素和表单元素。
2.增强了鼠标可用性。(当点击label中的文本时，其所关联的表单元素也会获得焦点)

* fieldset标签和legend标签

使用fieldset和legend标签有两个作用。
1.增强表单的语义。
2.可以定义fieldset元素的disabled属性来禁用整个组中的表单元素。

```html
<fieldset>
    <legend>表单组标题</legend>
    ...
</fieldset>
```

### 其他语义化

* `<br/>`标签只适合用于p标签内部的换行
* 有序列表前的数字外观是固定的,在实际开发中，大多数情况下都是使用无序列表，极少情况下会使用有序列表
* 在strong或者em标签内部的文本被强调为重要文本。并且搜索引擎对这两个标签也赋予一定的权重
* del表示“delete”，用于定义被删除的文本。ins表示“insert”，用于定义被更新的文本
* 如果图片作为HTML的一部分，并且想要被搜索引擎识别，则应该使用img标签，例如常见的各种图片列表。如果图片仅仅是起到修饰作用，并且不想被搜索引擎识别，则应该使用背景图片。

### 语义化验证

一个很简单的办法就是：去掉CSS样式，然后看页面是否还具有很好的可读性。
