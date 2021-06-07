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
