# Bootstrap 4.x + 5.x

## 布局系统

### 介绍

1. 对于容器布局，Bootstrap4.x 提供了.container 和.container-fluid 两种;
2. 这两种样式是启用布局栅格系统最基本的要素;
3. .contianer 是固体自适应方式，.container-fluid 是流体 100%自适应方式;
4. 容器布局可以嵌套，但一般来说，不推荐且很少使用到:
5. 自适应对应的响应式方式如下 media:

```css
// Small devices (landscape phones, 576px and up)
@media (min-width: 576px) {
  ...;
}
// Medium devices (tablets, 768px and up)
@media (min-width: 768px) {
  ...;
}
// Large devices (desktops, 992px and up)
@media (min-width: 992px) {
  ...;
}
// Extra large devices (large desktops, 1200px and up)
@media (min-width: 1200px) {
  ...;
}
```

6. 从响应式的 media 可以看出，Bootstrap4 是以移动端为优先的。

### 栅格系统

1. Bootstrap4.x 的栅格系统是一个以移动为优先的网格系统;
2. 基于 12 列的布局、5 种响应尺寸(面向不同屏幕设备);
3. 完全使用 flexbox 流式布局构建的，完全支持响应式标准;
4. 具体采用 div 容器的行、列和对齐内容来构建响应式布局;
5. `.row`表示一行，`.col-*`来表示一列
6. 如果我们采用的是`.container-fluid`，那么会 100%占用屏幕宽度;
7. 在.col-sm-\*的星号位置，还可以强制设定每列所占有的栅格列;
8. 所占的栅格位正好是 12 列，超过 12 列则会换行，小于 12 列则不能 100%;
9. 以上智能计算和强制设置栅格位都是等宽的，我们也可以设置不对称的;
10. `.col-`, `.col-sm-`, `.col-md-`, `.col-lg`, `.col-xl-`对应五种尺寸
11. 如果同时是使用两个或以上的级别，并且比例相同，则遵循移动端优先的原则
12. 栅格系统支持只指定其中一种或几种，其它随机的方式，指定数字奇偶均可

```html
<div class="container">
  <div class="row">
    <div class="col-sm">第一列</div>
    <div class="col-sm-7">第二列</div>
    <div class="col-sm">第三列</div>
  </div>
</div>
```

13. 可以通过两个或以上来实现不同设备不同比例的混合布局

```html
<div class="container">
  <div class="row">
    <div class="col-sm-8 col-xl-12">第一列</div>
    <div class="col-sm-4 col-xl-12">第二列</div>
  </div>
</div>
```

14. 使用`w-100`可以切割栅格栏位，进行分行操作;

```html
<div class="container">
  <div class="row">
    <div class="col">第一列</div>
    <div class="col">第二列</div>
    <div class="w-100"></div>
    <div class="col">第三列</div>
    <div class="col">第四列</div>
  </div>
</div>
```

15. 如果强制设置了 col-3 数值，那切割后，将不会自动填充;

```html
<div class="container">
  <div class="row">
    <div class="col-3">第一列</div>
    <div class="col-3">第二列</div>
    <div class="w-100"></div>
    <div class="col-3">第三列</div>
    <div class="col-3">第四列</div>
  </div>
</div>
```

## 对齐和排列

### 栅格对齐

1. 对于栅格系统中的行，我们可以其进行垂直对齐操作

| 效果  |         样式          |
| :---: | :-------------------: |
| 居顶  | `.align-items-start`  |
| 居中  | `.align-items-center` |
| 居底  |  `.align-items-end`   |

2. 要实现垂直效果，需要给行.row和列.c设置高度;

```css
.row {
   height: 100px;
   margin: 20px 0;
   border: dashed 1px red;
}
.c {
   border: solid 1px blue;
   height: 30px; 
}
```

3. 如果要垂直居中，那么直接设置: `.align-items-center`
```html
<div class="row align-items-center">
   <div class="c col">第一列</div>
   <div class="c col">第二列</div>
   <div class="c col">第三列</div>
</div>
```
4. 对于列来说，也有三种垂直居中的方法

| 效果  |         样式         |
| :---: | :------------------: |
| 居顶  | `.align-self-start`  |
| 居中  | `.align-self-center` |
| 居底  |  `.align-self-end`   |

5. 使用三种列垂直方案;

```html
<div class="row align-items-center">
   <div class="c col align-self-start">第一列</div>
   <div class="c col align-self-center">第二列</div>
   <div class="c col align-self-end">第三列</div>
</div>
```

6. 如果我们要不足100%填充的行实现水平对齐方式:

|      `效果`      |           `样式`           |
| :--------------: | :------------------------: |
|       居左       |  `.justify-content-start`  |
|       居中       | `.justify-content-center`  |
|       居右       |   `.justify-content-end`   |
| 间隔相等（分散） | `.justify-content-around`  |
| 两端对齐（分散） | `.justify-content-between` |

### 栅格排列

1. 栅格的列可以排序，使用.order-N，N最大值为12;
2. 如果我们要给一个三列的行的第一列排到最后，可以如下设置;

```html
<div class="row">
   <div class="c col-3 order-3">第一列</div>
   <div class="c col-3 order-2">第二列</div>
   <div class="c col-3 order-1">第三列</div>
</div>
```

3. 使用.order-first，强行设置列为第一列，而.order-last为最后一列
4. 使用.offset-N或.offset-*-N来设置列的偏移量，1表示一个栅格列;
5. 使用.ml-N或.mr-N来微调列距离，使用.ml-auto和.mr-auto来左右对齐;

```html
<div class="row align-items-start">
   <div class="c col-3">第一列</div>
   <div class="c col-3 ml-2">第二列</div>
   <div class="c col-3 ml-auto">第三列</div>
</div>
```

## 内容排版

### 标题类

1. `<h1>`~`<h6>`标签以外的元素标签，可以调用`.h1~6`实现对应标题效果
```html
<p class="h1">Bootstrap</p>
<div class="h2">Bootstrap</div>
```
2. 通过`.text-muted`样式，可以构建大标题的附属小标题
```html
<p class="h1">
  Bootstrap <small class="text-muted">V4.X</small>
</p>
<div class="h2">
  Bootstrap <small class="text-muted">V4.X</small>
</div>
```
3. 还有一种更大型，更加醒目的标题方式：`.display-1~4`
```html
<h1 class="display-1">Bootstrap</h1>
<h2 class="display-1">Bootstrap</h2>
<h3 class="display-1">Bootstrap</h3>
<h4 class="display-1">Bootstrap</h4>
```

### 文本类

1. 想要指定一些段落中的重要内容，可以使用`.lead`强调
```html
<p class="lead">
  测试
</p>
```
2. 常用的文本内联元素，来自HTML5：`<mark>`,`<del>`,`<s>`,`<ins>`,`<u>`,`<small>`,`<strong>`,`<em>`
3. 可以使用`.mark`,`.small`等方式实现对应的效果
```html
<p>测<span class="mark">试</span>一下</p>
<p class="small">测试</p>
```
4. 使用`.title`,`<abbr>`缩略语给文本做提示
```html
<p><abbr title="这是一个提示!">提示</abbr></p>
```
5. 使用`.blockquote`设置来源备注或者引用
```html
<blockquote class="blockquote">
  <p>测试</p>
</blockquote>
```
6. 使用`.blockquote-footer`设置底部备注来源
```html
<blockquote class="blockquote">
  <p>Winter is coming！</p>
  <footer class="blockquote-footer">
    ——《Game of Throne》
  </footer>
</blockquote>
```
7. 可以对内容进行居中对齐`.text-center`或居右对齐`.text-right`
```html
<blockquote class="blockquote text-center">
```

### 列表类

1. 使用`.list-unstyled`样式可以将列表初始化
```html
<ul class="list-unstyled">
  <li>A 班</li>
  <li>B 班</li>
  <li>C 班
    <ul>
      <li>张三</li>
      <li>李四</li>
      <li>王五</li>
      <li>马六</li>
    </ul>
  </li>
  <li>D 班</li>
</ul>
```
2. 使用`.list-inline`,`.list-inline-item`结合实现多列并排列表
```html
<ul class="list-inline">
  <li class="list-inline-item">A班</li>
  <li class="list-inline-item">B班</li>
  <li class="list-inline-item">C班</li>
  <li class="list-inline-item">D班</li>
</ul>
```
3. 使用`dl`,`dt`和`dd`可以实现水平描述，使用`.text-truncate`可以省略溢出
```html
<div class="container">
  <dl class="row">
    <dt class="c col-sm-3">列表标题</dt>
    <dd class="c col-sm-9">一个关于描述列表的内容</dd>
    <dt class="c col-sm-3">列表标题</dt>
    <dd class="c col-sm-4 text-truncate">一个关于描述列表的内容，
                          但是这个稍微长了一点点以至于换行!</dd>
  </dl>
</div>
```

## 代码与图文

### 代码样式

1. 使用`<code>`标签元素，可以将编程代码放入其中，但还是要手动转义特殊符号;
```html
<code>
  &lt;div&gt;
</code>
```
2. 使用`<pre>`标签元素，配合`<code>`可以实现代码块的效果;
```html
<pre class="pre-scrollable" style="width: 500px;">
  <code>
    &lt;div&gt;
      &lt;span&gt;这是一个代码块效果!&lt;span&gt;
    &lt;div&gt;
  </code>
</pre>
```
3. 可以在代码区域设置`.pre-scrollable`样式，实现固定区域滚动，默认高350px; 
```html
<pre class="pre-scrollable" style="width: 500px;">
```
4. 使用`<var>`标签元素标识变量部分;
```html
<var>y</var> = <var>m</var> + <var>b</var>
<var>y = m + b</var>
```
5. 使用`<kbd>`标签元素标识键盘输入;
```html
<kbd>ctrl</kbd>+<kbd>shift</kbd>+<kbd>c</kbd>
```
6. 使用<samp>标签元素标识这是一个示例;
```html
<samp>这是一段代码</samp>
```

### 图文样式

1. 给图片添加一个`.img-fluid`样式或设置`max-width:100%; height:auto`;
```html
<img src="img/heart.png" class="img-fluid" alt="缩略图">
```
2. 给小图片加上一个缩略图的样式`.img-thumbnail`，设置一个空心边框;
```html
<img src="img/heart.png" class="img-thumbnail" alt="缩略图">
```
3. 通过设置`.float-left`和`.float-right`来设置图片的左右浮动;
```html
<img src="img/heart.png" class="float-left" alt="左浮动">
<img src="img/heart.png" class="float-right" alt="右浮动">
```
4. 通过`.d-block`设置为区块，再通过margin左右auto方式`.mx-auto`实现居中;
```html
<img src="img/heart.png" class="mx-auto d-block">
```
5. 因为图片本身是内联块属性，所以，直接在父层用`.text-center`也可以实现居中;
```html
<div class="text-center">
  <img src="img/heart.png">
</div>
```
6. 使用HTML5新标签`<picture>`来实现响应式图片设置;
```html
<picture>
  <source srcset="img/banner2.png" media="(max-width:800px)">
  <img src="img/banner.png" alt="大图">
</picture>
```
7. 使用`figure`和`figcaption`实现图文组合显示;
```html
<figure class="figure">
  <img src="img/heart.png" class="figure-img" alt="图文组合">
  <figcaption class="figure-caption text-right">图片一枚</figcaption>
</figure>
```

## 表格样式

1. 使用`.table`给表格设置一个基类，这是表格的基本样式;
```html
<table class="table">
  <thead>
    <tr>
      <th>ID</th>
      <th>姓名</th>
      <th>性别</th>
      <th>成绩</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1</td>
      <td>张三</td>
      <td>男</td>
      <td>98</td>
    </tr>
    <tr>
      <td>2</td>
      <td>李四</td>
      <td>女</td>
      <td>69</td>
    </tr>
    <tr>
      <td>3</td>
      <td>王五</td>
      <td>男</td>
      <td>97</td>
    </tr>
  </tbody>
</table>
```
2. 使用`.table-dark`样式，启用颜色反转对比效果;
```html
<table class="table table-dark">
```
3. 在`<thead>`使用`.thead-light`或`.thead-dark`实现浅黑或深灰色调的标头;
```html
<thead class="thead-light">
```
4. 使用`.table-striped`实现数据表的条纹状显示;
```html
<table class="table table-striped">
```
5. 条纹状显示也适用于反转色调上;
```html
<table class="table table-dark table-striped">
```
6. 默认情况下，边框是不完全的，使用`.table-bordered`设置表格边框;
```html
<table class="table table-bordered">
```
7. 表格边框也可以作用域反转色调上;
```html
<table class="table table-bordered table-dark">
```
8. 使用`.table-borderless`设置无边框;
```html
<table class="table table-borderless">
```
9. 无边框效果也可以作用于反转色调上;
```html
<table class="table table-borderless table-dark">
```
10. 使用`.table-hover` 实现一行悬停效果;
```html
<table class="table table-hover">
```
11. 行悬停效果也可以作用于反转色调上;
```html
<table class="table table-hover table-dark">
```
12. 使用`.table-sm` 实现紧缩型表格，反转色调依然支持;
```html
<table class="table table-sm">
```
13. 使用`.table-success` 等语义化实现`<tr>`或`<td>`、`<th>`等效果，反转色调通用;
```html
<tr class="table-success>
```
> `.table-*`包括: active, primary, seconday, danger, warning, info, light, dark
14. 使用`.table-responsive` 实现溢出时出现底部滚动条;
```html
<table class="table table-responsive">
```
15. 使用`.table-responsive-sm` 实现只有小于 768px 溢出时出现底部滚动条;
```html
<table class="table table-responsive-sm">
```

## 边框和颜色

### 边框样式

1. 使用.border给元素增加相应的边框，默认是淡灰色;
2. 如果颜色太淡，可以使用`.border-*`设置想要的场景;
3. `.border-*`，包含:primary、secondary、success、danger、warning、info、light、dark 和 white;
```html
<img src="img/img1.png" alt="border" class="border-success border">
<img src="img/img1.png" alt="border" class="border-success border-top">
<img src="img/img1.png" alt="border" class="border-success border-bottom">
<img src="img/img1.png" alt="border" class="border-success border-left">
<img src="img/img1.png" alt="border" class="border-success border-right">
```
4. 使用`.border-0`消减四周的边框，或使用`.border-*-0`消减某一边的边框;
```html
<img src="img/img1.png" alt="border" class="... border-0">
<img src="img/img1.png" alt="border" class="... border-top-0">
<img src="img/img1.png" alt="border" class="... border-bottom-0">
<img src="img/img1.png" alt="border" class="... border-left-0">
<img src="img/img1.png" alt="border" class="... border-right-0">
```
5. 使用`.rounded`和`.rounded-*`实现各种方位圆角;
```html
<img src="img/img2.png" alt="圆角" class="rounded">
<img src="img/img2.png" alt="圆角" class="rounded-top">
<img src="img/img2.png" alt="圆角" class="rounded-bottom">
<img src="img/img2.png" alt="圆角" class="rounded-left">
<img src="img/img2.png" alt="圆角" class="rounded-right">
<img src="img/img2.png" alt="圆角" class="rounded-cicle">
<img src="img/img2.png" alt="圆角" class="rounded-pill">
<img src="img/img2.png" alt="圆角" class="rounded-0">
```
6. 使用`.rounded-sm`和`.rounded-lg`实现圆角半径大小;
```html
<img src="img/img2.png" alt="圆角" class="rounded-sm">
<img src="img/img2.png" alt="圆角" class="rounded-lg">
```

### 颜色样式

1. 使用.text-*将文本设置成指定的颜色，比如:text-success;
```html
<span class="text-primary">Bootstrap</span>
<span class="text-secondary">Bootstrap</span>
<span class="text-success">Bootstrap</span>
<span class="text-danger">Bootstrap</span>
<span class="text-warning">Bootstrap</span>
<span class="text-info">Bootstrap</span>
<span class="text-dark">Bootstrap</span>
<span class="text-body">Bootstrap</span>
<span class="text-muted">Bootstrap</span>
<span class="text-light bg-dark">Bootstrap</span>
<span class="text-white bg-dark">Bootstrap</span>
<span class="text-black-50">Bootstrap</span>
<span class="text-white-50 bg-dark">Bootstrap</span>
```
2. 使用`.text-*`也可以实现悬停和焦点的超链接样式，white和muted不支持;
```html
<a href="#" class="text-primary">Bootstrap</span>
<a href="#" class="text-secondary">Bootstrap</span>
<a href="#" class="text-success">Bootstrap</span>
<a href="#" class="text-danger">Bootstrap</span>
<a href="#" class="text-warning">Bootstrap</span>
<a href="#" class="text-info">Bootstrap</span>
<a href="#" class="text-dark">Bootstrap</span>
<a href="#" class="text-body">Bootstrap(no)</span>
<a href="#" class="text-muted">Bootstrap(no)</span>
<a href="#" class="text-light bg-dark">Bootstrap</span>
<a href="#" class="text-white bg-dark">Bootstrap</span>
<a href="#" class="text-black-50">Bootstrap</span>
<a href="#" class="text-white-50 bg-dark">Bootstrap</span>
```
3. 使用`.bg-*`可以实现背景色;

## 公共样式

1. 使用`.close`和`&times`构建一个关闭按钮;
```html
<button type="button" class="close">
  <span>&times;<span>
</button>
```
2. 使用`.clearfix`给浮动的区域的父元素添加，实现清理浮动的功能;
```html
<style>
  div.border {
    width: 200px;
    height: 200px;
  }
</style>

<div class="clearfix">
  <div class="float-left border border-success">left</div>
  <div class="float-right border border-success">right</div>
</div>

<div class="border border-warning">both</div>
```
3. 使用`.float-left`、`.float-right`、`.float-none`实现浮动效果;
4. 还可以使用`.float-*-left`等来实现不同屏幕的浮动效果;
```html
<div class="float-md-left border border-success">left</div>
<div class="float-md-right border border-success">right</div>
```
5. 使用`.text-hide`来隐藏元素标签内容，但本身还存在保持SEO优化;
```html
<h1 class="text-hide" style="background:url('img/img1.png');">Bootstrap</h1>
```
6. 使用`.overflow-auto`和`.overflow-hidden`来设置区域显示方式;
```html
<div class="overflow-auto">...</div>
<div class="overflow-hidden">...</div>
```
7. 使用`.visible`和`.invisible`来设置内容可见或不可见;
```html
<div class="visible">Bootstrap</div>
<div class="invisible">Bootstrap</div>
```
8. 使用`.align-*`来设置内容文本的对齐方式;
```html
<span class="align-baseline">baseline基准</span>
<span class="align-text-top">text-top文本底部</span>
<span class="align-top">top顶部</span>
<span class="align-middle">middle垂直居中</span>
<span class="align-bottom">bottom底部</span>
<span class="align-text-bottom">text-bottom文本底部</span>

<table class="table table-bordered" style="height: 200px;">
  <tbody>
    <tr>
      <td class="align-baseline">baseline</td>
      <td class="align-top">top</td>
      <td class="align-middle">middle</td>
      <td class="align-bottom">bottom</td>
      <td class="align-text-top">text-top</td>
      <td class="align-text-bottom">text-bottom</td>
    </tr>
  </tbody>
</table>
```

> 垂直对齐仅影响内联inline、内联块inline-block、内联表inline-table和表格单元格table cell元素

9. 使用`.p-*`来设置内边距(padding)，范围在0-5之间和auto;
```html
<span class="p-5">Bootstrap</span>
```
10. 使用`.m-*`来设置外边距(margin)，范围在0-5之间和auto;
```html
<span class="m-5">Bootstrap</span>
```
11.  使用`.pt-*`或`mt-*`单独设置边缘的距离，这里的t是top;
12. 其它的还有b(bottom)、l(left)、r(right)等;
13. 使用`.px-*`或`mx-*`设置左右边缘的距离，这里的x表示(left、right);
14. 使用`.py-*`或`my-*`设置上下边缘的距离，这里的y表示(top、bottom);
15. 使用`.pt-*-5`，*可以是md、lg等响应式的方式来设置边缘;
16. 使用`.w-*`设置元素的长度，包括25%、50%、75%、100%和auto;
```html
<div class="border border-success">
  <div class="p-3 h-25 bg-info d-inline-bolck">25%</div>
  <div class="p-3 h-50 bg-info d-inline-bolck">50%</div>
  <div class="p-3 h-75 bg-info d-inline-bolck">75%</div>
  <div class="p-3 h-100 bg-info d-inline-bolck">100%</div>
  <div class="p-3 h-auto bg-info d-inline-bolck">auto</div>
</div>
```
17. 使用`.h-*`设置元素的高度，包括25%、50%、75%、100%和auto;
18. 使用`.mw-*`和`.mh-*`设置 max-width 和 max-height;
19. 使用`.vw-*`和`.vh-*`设置相对于窗口的大小;
20. 使用`.shadow-*`实现元素的阴影效果;
```html
<div class="shadow-none mb-5">Bootstrap</div>
<div class="shadow-sm mb-5">Bootstrap</div>
<div class="shadow mb-5">Bootstrap</div>
<div class="shadow-lg mb-5">Bootstrap</div>
```
21. 使用`.d-*`来设置元素的display模式：none、inline、inline-block、block、table、table-row
22. flex、inline-flex这些常用的均为display可以设置的模式;
23. 也可以通过`.d-md-*`中的md设置响应式的媒体查询效果;
24. 使用`.embed-responsive`实现嵌入响应式，比如`<iframe>`、`<embed>`等;
25. 使用`.embed-responsive-16by9`实现响应式比例，还可以21:9，4:3，1:1;
```html
<div class="embed-responsive embed-responsive-16by9">
  <iframe src="http://www.google.com"></iframe>
</div>
```
26. 使用`.text-*`设置文本的对齐方式，有left、center、right;
27. 也可以设置`.text-md-*`实现响应式的媒体查询效果;
28. 使用`.text-warp`和`.text-nowarp`实现文本溢出时是否换行;
29. 使用`.text-break` 对于很长的字符串，且中间没有空格实现换行;
30. 使用`.text-lowercase` 设置小写，`.text-uppercase` 设置大写，以及 `.text-capitalize` 设置首字母大写;
31. 使用`.font-weight-bold` 加粗、`.font-weight-normal` 正常、 `.font-weight-light` 纤细、`.font-weight-italic` 倾斜;
32. 使用`.text-monospace` 设置等宽字体;
33. 使用`.text-reset` 实现字体颜色的重置;
```html
<div class="text-muted">
  Bootstrap <a href="#" class="text-reset">V5.0</a>
</div>
```
34. 使用`.text-decoration-none` 删除超链接下划线;
```html
<a href="#" class="text-decoration-none">Bootstrap</a>
```

## Flex弹性布局

1. 使用`.d-flex`和`.d-inline-flex`开启flex布局样式，支持`.d-*-flex`响应式媒体查询
2. `.flex-row`可以呈现子元素水平方向的位置，默认居左并从左到右显示(1,2,3);
```html
<div class="d-flex flex-row">
  <div class="p-2">项目1</div>
  <div class="p-2">项目2</div>
  <div class="p-2">项目3</div>
</div>
```
3. `.flex-row-reverse`让子元素水平方向的位置居右并从左到右显示(3,2,1);支持响应式媒体查询`.flex-*-row`;
4. `.flex-column`实现子元素垂直效果，并从上往下显示(1,2,3);
5. `.flex-column-reverse`实现子元素垂直效果，并从上往下显示(3,2,1);支持响应式媒体查询`.flex-*-column`;
6. `.justify-content-start(end、center、between、around)`实现主轴内容对齐;支持媒体查询:`justify-content-*-start`;
7. `.align-items-start(end、center、baseline、stretch)`实现副轴项目对齐;支持媒体查询:`align-items-*-start`;
8. `.align-self-start(end、center、baseline、stretch)`实现单项目对齐;
9. 使用`.flex-fill`强制让每个元素项目占据相等的水平宽度;支持媒体查询:`flex-*-fill`;
10. 同时设置`.flex-fill`的项目等比例分割宽度，适合做导航项目;如果其中有没有设置的则会被设置的填充宽度;
11. 使用`.flex-grow-*`，*表示0或1，也能实现`.flex-fill`的功能，设置1即可;支持媒体查询:`flex-*-grow`;
12. 使用`.flex-shrink-*`，*表示0或1，表示是否强制更换到新行中;支持媒体查询:`flex-shrink-*`;
13. 使用`.mr-auto`等对齐方式，对flex元素进行浮动对齐;
14. 对于垂直方向，也可以使用`.mb-auto` 和`.mt-auto` 来设置对象方向;
15. 使用`.flex-wrap`(包裹)和`.flex-nowrap`(不包裹，默认)来设置子元素项目;
16. 使用`.flex-wrap-reverse`进行项目倒序排序;支持媒体查询:`.flex-*-wrap`;
17. 使用`.order-*`设置子元素项目的排序顺序;支持媒体查询:`.order-*-*`;

## 警告提示框

### 警告框样式

1. 使用`.alert`设置警告框基础样式，可以设置警告框颜色;
```html
<div class="alert alert-success">Bootstrap</div>
<div class="alert alert-primary">Bootstrap</div>
<div class="alert alert-secondary">Bootstrap</div>
<div class="alert alert-danger">Bootstrap</div>
<div class="alert alert-warning">Bootstrap</div>
<div class="alert alert-info">Bootstrap</div>
<div class="alert alert-light">Bootstrap</div>
<div class="alert alert-dark">Bootstrap</div>
```
2. 在使用了警告框的元素内部设置超链接`.alert-link`，会搭配相应的颜色;
```html
<div class="alert alert-success">
  Bootstrat <a href="#" class="alert-link">V5.0</a>
</div>
```
3. 使用`.alert-heading`可以设置继承颜色，alert本身也可以设置水平线段落等;
```html
<div class="alert alert-success">
  <h4 class="alert-heading">Bootstrap</h4>
  <hr>
  <p>前端框架之一</p>
</div>
```

### 警告框组件

1. 在组件一栏，可以和浏览器实现交互功能，比如警告框的关闭效果;
```html
<div class="alert alert-warning alert-dismissible fade show">
  警告⚠️：请不要使用IE
  <button class="close" date-dismiss="alert">&times;</button>
</div>
```
2. `data-dismiss="alert"`实现父元素关闭;
3. `.fade`、 `.show` 实现了关闭后的淡出效果;

## 徽章和面包屑导航

### 徽章样式

1. 使用`.badge`设置徽章基础样式，并使用`.badge-success`等设置徽章颜色;
```html
<h4>Bootstrap <span class="badge badge-success">V5.0</span></h1>
...
```
2. 使用`.badge-pill`将徽章设置成椭圆胶囊式;
```html
<h3>Bootstrap
  <span class="badge badge-info badge-pill">V5.0</span>
</h3>
```
3. 在超链接使用徽章，鼠标悬停时会有换色效果;
```html
<h3>Bootstrap
  <a href="#" class="badge badge-success badge-pill">V5.0</a>
</h3>
```

### 面包屑导航

1. 使用`.breadcrumb`设置一个层次导航;
```html
<nav>
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="#">Home</a></li>
    <li class="breadcrumb-item"><a href="#">Library</a></li>
    <li class="breadcrumb-item active">Bootstrap</li>
  </ol>
</nav>
```

## 按钮和按钮组

### 按钮样式

* 使用`.btn`和`.btn-*`实现按钮的预设样式;

  ```html	
   <button type="button" class="btn btn-primary">Bootstrap</button>
  ```

* `.btn`不单单在`<button>`元素下使用，也可以在`<a>`、`<input>`下使用;

  ```html
  <a href="#" class="btn btn-success">Bootstrap</a>
  <input type="submit" class="btn btn-danger" value="Bootstrap">
  ```

* 使用`.btn .btn-outline-*`可以实现按钮的轮廓效果;
* 使用`.btn-lg`、`.btn-sm`可以实现按钮尺寸的大和小;
* 使用`.btn-block`将按钮进行block区块设置;
* 使用`.active`启用按钮(默认)，使用`.disabled`禁用按钮，特别注意`<a>`的禁用;
* 添加`data-toggle="button"`实现按钮切换效果，使用`.active`可以默认按下;

### 按钮组样式

* 使用`.btn-group` 实现传统方案的复选框和单选框样式;

  ```html
  <div class="btn-group" data-toggle="buttons">
    <label class="btn btn-secondary active">
      <input type="checkbox" checked>Python
    </label>
    
    <label class="btn btn-secondary">
      <input type="checkbox">JavaScript
    </label>
    
    <label class="btn btn-secondary">
      <input type="checkbox">Java
    </label>
  </div>
  
  <div class="btn-group" data-toggle="buttons">
    <label class="btn btn-secondary active">
      <input type="radio" name="options" checked>Python
    </label>
    
    <label class="btn btn-seconday">
      <input type="radio" name="options">JavaScript
    </label>
    
    <label class="btn btn-secondary">
    	<input type="radio" name="options">Java
    </label>
  </div>
  ```

  

* 使用`.btn-group` `.btn-group-toggle`实现全新方案的复选框和单选框;

* 使用`.btn-group`构建普通的按钮组;

* 使用`.btn-toolbar`构建分页工具类;

  ```html
  <div class="btn-toolbar">
    <div class="btn-group mr-2">
      <button type="button" class="btn-secondary">1</button>
      <button type="button" class="btn-secondary">2</button>
      <button type="button" class="btn-secondary">3</button>
      <button type="button" class="btn-secondary">4</button>
      <button type="button" class="btn-secondary">5</button>
    </div>
    
    <div class="btn-group">
      <button type="button" class="btn btn-secondary">6</button>
      <button type="button" class="btn btn-secondary">7</button>
      <button type="button" class="btn btn-secondary">8</button>
      <button type="button" class="btn btn-secondary">9</button>
    </div>
  </div>
  ```

  

* 使用`.btn-group-lg`和`.btn-group-sm`实现大尺寸和小尺寸;

* 使用`.btn-group-vertical`设置垂直按钮组;



## 卡片

* 卡片是一个内容扩展管理器，可以包含图片、列表、文本、链接等多种组合;

* 先使用`.card` 来构建卡片，然后可以使用`.card-body` 建立卡片主体内容;

* 卡片主体标题可以使用`.card-title`(标题)`.card-subtitle`(小标题)等;

* 卡片主体使用`.card-text`代表文本内容;

* 卡片主体使用`.card-link`代表超链接;

* 使用`.card-img-top`可以设计一个带主题图片的内容管理器;

  ```html
  <div class="card" style="width: 300px">
    <img class="card-img-top" src="img/bt.png" alt="bt">
    <div class="card-body">
      Bootstrap
    </div>
  </div>
  ```

* 使用`.card-header`设置一个列表组的标头;

  ```html
  <div class="card" style="width: 300px">
    <div class="card-header">
      Title
    </div>
    <ul class="list-group list-group-flush">
      <li class="list-group-item">Item 1</li>
      <li class="list-group-item">Item 2</li>
      <li class="list-group-item">Item 3</li>
    </ul>
  </div>
  ```

* 使用`.card-footer`配合`.card-header`，负责页眉页脚;

* 卡片默认是100%显示的，可以使用栅格系统嵌套来固定卡片的布局;

* 也可以使用.w-25、.w-50、w-75、w-100 来设置卡片的显示百分比;

* 卡片支持文本的整体对齐和局部的对齐方式，采用`.text-center` 等;

*  卡片使用`.card-header-tabs`可以配合列表`ul`实现导航功能;

  ```html
  <div class="card text-center" style="width: 500px">
    <div class="card-header">
      <ul class="nav nav-tabs card-header-tabs">
        <li class="nav-items">
          <a href="#" class="nav-link active">主页</a>
        </li>
        <li class="nav-items">
          <a href="#" class="nav-link">内容</a>
        </li>
        <li class="nav-items">
          <a href="#" class="nav-link">关于</a>
        </li>
      </ul>
    </div>
    <div class="card-body">
      ...
    </div>
  </div>
  ```

* 将ul中的类改成按钮式`.nav-pills .card-header-pills`实现按钮导航;

* 卡片中`.card-img`插入一个整体的图片，再配合`.card-img-overlay`实现背景;

* 卡片通过内部栅格，也可以实现左右水平排列的图文显示;

* 卡片可以定制自己的背景、颜色、边框

* 在`.card`元素外层，构建一个`.card-group`分组，可以紧紧将每个卡片贴在一起;

* `.card-group`本身就具有栅格系统，但会紧贴对应的`.card-deck`提供间隙;

## 列表组

* 列表组ul使用`.list-group`,li使用`.list-group-item`实现项目
* 使用`.active`在项目中实现首选项、使用`.disabled`在项目中实现禁用
* 将ul、li替换成div、a实现列表组的功能，需配合`.list-group-item-action`;
* 使用`.list-group-flush`实现紧贴效果，就是外围无边框;
* 使用`.list-group-horizontal`实现水平排列效果
* `.list-group-horizntal-*`，`*`号可以表示md,sm,lg,xl等屏幕响应式
* 列表语境颜色显示`.list-group-item-*`，`*`表示颜色;
* 可以将`.badge` 徽章引入到列表组里，并进行适当的排版布局;

## 分页和进度条

### 分页

* 使用`.pagination`和`.page-items`、`.page-link`构建一个列表模式分页

  ```html
  <ul class="pagination">
    <li class="page-item"><a href="#" class="page-link">首页</a></li>
    <li class="page-item"><a href="#" class="page-link">1</a></li>
    <li class="page-item"><a href="#" class="page-link">2</a></li>
    <li class="page-item"><a href="#" class="page-link">3</a></li>
    <li class="page-item"><a href="#" class="page-link">4</a></li>
    <li class="page-item"><a href="#" class="page-link">尾页</a></li>
  </ul>
  ```

* 在li标签下使用`.disabled`可以禁用某个分页项目;

* 直接将a标签替换为span标签，直接使链接失效但不会显示禁用的灰色样式;

* 通过`.pagination-lg`(或其它)来实现，分页样式的大小;

* 通过`.justify-content-center`(或其它)来实现，分页对齐方式;

### 进度条

* 使用`.progress`和`.progress-bar`构建一个进度条

  ```html
  <div class="progress">
    <div class="progress-bar" style="width: 25%"></div>
  </div>
  ```

* 使用.w-50样式，也可以实现项目进度，只不过数值有局限;

* 设置进度条高度，使用普通高度样式即可;

* 在进度条项目中，可以设置进度条的颜色;

  ```html
  <div class="progress">
    <div class="progress-bar w-50 bg-danger"></div>
  </div>
  ```

* 使用`.progress-bar-striped`实现条纹进度条;

* 在条纹进度条的基础上，使用`.proress-bar-animated`实现动画效果;

## 大块屏和旋转特效

### 大块屏

* 大块屏`.jumbotron` 是为了展示一些核心内容或广告内容的区域;

  ```html
  <div class="jumbotron">
    <h1 class="display-4">Bootstrap</h1>
    <p class="text-muted">这里是标题简介</p>
    <hr/>
    <p class="lead">这里是各种内容的区域</p?
    <p class="lead">
    	<button class="btn btn-success btn-lg">按钮</button>
    </p>
  </div>
  ```

### 旋转特效

* 使用`.spinner-border`实现类似loading...的旋转特效

* 使用`.text-success`(或其它)给旋转特效增加各种颜色;

* 使用`.spinner-grow`可以实现渐变式loading...特效;

* 使用`.m-[1-5]`外边距来调整距离，如果精确就用普通的CSS;

* 通过`.spinner-broder-sm`或`.spinner-grow-sm`实现特效尺寸的大小;

* 通过`.text-center`，将特效当作文本进行左中右排列，flex方式雷同;

* 结合button按钮和文本，实现禁用状态下的loading...;

  ```html
  <button class="btn btn-info" disabled>
    <div class="spinner-border spinner-border-sm"></div>
    <span>Loading...</span>
  </button>
  ```

## 轮播效果

* 一个经典的例子：

  ```html
  <div class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="img/1.png" class="w-100" alt="">
      </div>
      <div class="carousel-item">
        <img src="img/2.png" class="w-100" alt="">
      </div>
      <div class="carousel-item">
        <img src="img/3.png" class="w-100" alt="">
      </div>
    </div>
  </div>
  ```

* 给轮播幻灯片两侧加上切换按钮:

  ```html
  <div class="carousel slide" data-ride="carousel">
  	...
    <a class="carousel-control-prev" href="#carousel" data-slide="prev">
      <span class="carousel-control-prev-icon"></span>
    </a>
    <a class="carousel-control-next" href="#carousel" data-slide="next">
      <span class="carousel-control-next-icon"></span>
    </a>
  </div>
  ```

* 给轮播幻灯片底部加上切换按钮:

  ```html
  <div id="carousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carousel" data-slide-to="0" class="active"></li>
      <li data-target="#carousel" data-slide-to="1"></li>
      <li data-target="#carousel" data-slide-to="2"></li>
    </ol>
    ...
  </div>
  ```

* 给轮播幻灯片底加上一些字符说明:

  ```html
  <div class="carousel-item active">
    <img src="img/1.png" class="w-100" alt="">
    <div class="carousel-caption">
      <h5>Bootstrap</h5>
    </div>
  </div>
  ```

* 给轮播幻灯片设置渐进式轮播效果:`class="carousel slide carousel-fade"`

* 通过JS控制，来设置轮播的各项数值，代替`data-ride="carousel"`:

  ```javascript
  $('.carousel').carousel({
    interval: 500
  })
  ```

* 通过JS控制，使用按钮来控制轮播器的各项操作:

  ```javascript
  $('.button').click(function() {
    $('.carousel').carousel('cycle');
    $('.carousel').carousel('pause');
    $('.carousel').carousel('prev');
    $('.carousel').carousel('next');
    $('.carousel').carousel(<slide-number>);
  })
    
  ```



