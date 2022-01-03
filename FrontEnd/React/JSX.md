# JSX

> JSX是一种JavaScript的语法扩展（eXtension）注:官网说法  
> 也有说法叫JavaScript XML  
> 本质上是`React.createElement(type, config, children)`方法的语法糖(所以需要引入React)

## 书写规范

* 我们通常在JSX的外层包裹一个小括号`()`，这样可以方便阅读
* 可以使用双标签和单标签,但是标签必须闭合
* JSX可以进行换行书写
* 不能有多个根标签，**只能有一个根标签**(通常使用`div`标签包裹,不过也可以使用`Fragment`)
* 样式的类名指定不要使用class，使用`className`
* 内联样式要使用`style={{样式:"值"}}`
* 标签中混入JS表达式的时候使用`{}`
* 定义虚拟DOM，不能使用`“”`
* 利用 JSX 编写 DOM 结构，可以用原生的 HTML 标签(小写)，也可以直接像普通标签一样引用 React 组件(大写开头)

## 注释

```jsx
const content = (
  <Nav>
      {/* child comment, put {} around */}
      <Person
        /* multi
           line
           comment */
        name={window.isLoggedIn ? window.name : ''} // end of line comment
      />
  </Nav>
);
```

## 参考链接

* [JSX核心语法及JSX本质浅析](https://juejin.cn/post/6996214286292877326)
* [使用 JSX](https://hulufei.gitbooks.io/react-tutorial/content/jsx-in-depth.html)
