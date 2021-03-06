# CSS3 + Div + Bootstrap

## 选择器

### 基本选择器

|        选择器        |    类型    |
| :------------------: | :--------: |
|          *           | 通配选择器 |
|          E           | 元素选择器 |
|         #ID          |  ID选择器  |
|        .class        |  类选择器  |
| selector1, selectorN | 群组选择器 |

### 层次选择器

| 选择器 |      类型      |
| :----: | :------------: |
|  E F   |   后代选择器   |
|  E>F   |    子选择器    |
|  E+F   | 相邻兄弟选择器 |
|  E~F   | 通用兄弟选择器 |

### 伪类选择器

#### 动态伪类选择器

|  选择器   |   功能   |
| :-------: | :------: |
|  E:link   | 未被访问 |
| E:visited | 已被访问 |
|  E:hover  |   停留   |
| E:active  |  被激活  |
|  E:focus  | 获得焦点 |

> “爱恨原则” LoVe/HAte
> Link-visited-hover-active

#### 目标伪类选择器

|  选择器  |                  功能描述                   |
| :------: | :-----------------------------------------: |
| E:target | 选择匹配E的所有元素,且匹配元素被相关URL指向 |

#### 语言伪类选择器

:lang E(language)表示选择匹配E的所有元素，且匹配元素指定了lang属性，而且其值为language。

#### UI元素状态伪类选择器

|   选择器   |   类型   |
| :--------: | :------: |
| E:checked  | 选中状态 |
| E:enabled  | 启用状态 |
| E:disabled | 禁用状态 |

#### 结构伪类选择器

* E:first-child
* E:last-child
* E:root
* E F:nth-child(n)
* E F:nth-last-child(n)
* E:nth-of-type(n)
* E:nth-last-of-type(n)
* E:first-of-type
* E:last-of-type
* E:only-child
* E:empty

> n可以是整数,关键字(even,odd),公式(2n+1)等
> n的起始值为1,当n为0时将选择不到任何元素
> “:empty”用来选择没有任何内容的元素，这里“没有任何内容”指的是一点内容都没有，哪怕是一个空格。

#### 否定伪类选择器

|  选择器  |         功能描述         |
| :------: | :----------------------: |
| E:not(F) | 匹配所有除元素F外的E元素 |

### 伪元素选择器

> 双冒号与单冒号在CSS3中主要用来区分伪类和伪元素。

* ::first-letter
* ::first-line
* ::before
* ::after
* ::selection

### 属性选择器

|    选择器     |                   功能描述                   |
| :-----------: | :------------------------------------------: |
|    E[attr]    |         选择匹配具有属性attr的E元素          |
|  E[attr=val]  |        attr的属性值为val(区分大小写)         |
| E[attr\|=val] |    attr属性值是一个具有val或者以val-开始     |
| E[attr~=val]  | attr属性具有多个空格分隔的值,其中一个值为val |
| E[attr*=val]  |         attr属性中任意位置包含了val          |
| E[attr^=val]  |              attr属性以val开头               |
| E[attr$=val]  |              attr属性以val结尾               |

> E省略时表示任意类型元素

## 边框

### 基本属性

* border-width
* border-color
* border-style

缩写语法:

```css
border: border-width border-style border-color;
```

> 没有先后次序
> 只有`border-style`必须

TRBL原则:

```css
border-style: <all>;
border-style: <horizontal> <vertical>;
border-style: <top> <horizontal> <bottom>;
border-style: <top> <right> <bottom> <left>;
```

[border-style](https://developer.mozilla.org/zh-CN/docs/Web/CSS/border-style)

### [边框颜色](https://developer.mozilla.org/zh-CN/docs/Web/CSS/border-color)

### [图片边框](https://developer.mozilla.org/zh-CN/docs/Web/CSS/border-image)

### [圆角边框](https://developer.mozilla.org/zh-CN/docs/Web/CSS/border-radius)

### [盒子阴影](https://developer.mozilla.org/zh-CN/docs/Web/CSS/box-shadow)

## 背景
