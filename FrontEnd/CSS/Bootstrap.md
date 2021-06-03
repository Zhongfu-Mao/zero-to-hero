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
