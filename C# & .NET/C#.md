# 基础知识

The C# compiler (named Roslyn) used by the dotnet CLI tool converts your C# source code into intermediate language (IL) code and stores the IL in an assembly (a DLL or EXE file). IL code statements are like assembly language instructions, which are executed by .NET's virtual machine, known as CoreCLR.

# 版本

## C# 1.0

* Released in 2002
* Included all the important features of a statically typed object-oriented modern language

## C# 2.0

* Released in 2005
* Enabling strong data typing using **generics**
* Nullbale value type

## C# 3.0

* Released in 2007
* Anonymous type and lambda expression
* Implicitly typed local variables
* Enabling declarative coding with LINQ(Language INtegrated Queries)

## C# 4.0

* Released in 2010
* Improving interoperability with dynamic languages like F# and Python
* Dynamic types
* Named/optional arguments

## C# 5.0

* Released in 2012
* Simplify asynchronous operation support by automatically implementing complex state machines while writing what looks like synchronous statements

## C# 6.0

* Released in 2015
* `Static` imports
* Interpolated strings
* Expression bodied members

## C# 7.0

* Released in March 2017
* Binary literals and digit separators(`_`)
* Pattern matching
* `out` variables
* Tuples 
* Local functions

## C# 7.1

* Released in August 2017
* Default literal expressions
* Inferred tuple element names
* `async Main`

## C# 7.2

* Released in November 2017
* Leading underscores in numeric literals
* Non-trailing named arguments
* `private protected`
* Test `==` and `!=`with tuple types

## C# 7.3

* Released in May 2018
* Focused on performance-oriented safe code that improves ref  variables, pointers, and stackalloc

## C# 8.0

* Released in September 2019
* Nullable reference types
* Switch expressions
* Default interface methods

## C# 9.0

* Released in November 2020
* Minimal-code console apps(top-level program)
* Records
* Enhanced pattern matching
* target-typed new: exp`XmlDocument xml = new()`

## 指定版本

SDK默认采用最近的主版本(如9.0),如果想使用次版本,需要在项目中指定

```xml
<LangVersion>9.1</LangVersion>
<!--
支持的选项包括:
	* 具体的版本号
	* latestmajor
	* latest
	* preview
-->
```



# 语法

## 声明

* 以分号结尾

## 注释

* 单行: `//`
* 多行:`/* */`
* 文档:`///`

## 块

* 用`{}`包裹
* 用于声明命名空间,类,方法或声明

## 关键字

* 一共104个

## 数据类型

* 字符类型: `char`

* 字符串类型:`string`

  * 三种类型
    * Literal String: `""`
    * Verbatim String: `@""`(类似Python的raw string)
    * Interpolated string: `$""`(类似Python的f-string,和PowerShell中一样)
  * 特殊变量
    * `string.Empty`

* 数字类型

  * 有符号整数
    * 有符号字节型:`byte`
    * 有符号短整型:`short`
    * 有符号整数型:`int`
    * 有符号长整型:`long`
  * 无符号整数
    * 无符号字节型:`sbyte`
    * 无符号短整型:`ushort`
    * 无符号整数型:`uint`
    * 无符号长整型:`ulong`
  * 实数
    * 单精度浮点型:`float`
    * 双精度浮点型:`double`
      * `double.Nan`
      * `double.Epsilon`
      * `double.Infinity`
    * Decimal类型:`decimal`(配合`M`后缀使用)

* 布尔类型:`bool`

  * `true`
  * `false`

* 任意类型:`object`(类似TypeScript的`any`)

* 任意动态类型:`dynamic`

* 空类型:`null`

* 可空类型(nullable)

  ```csharp
  #nullable disable
  // 在文件的首行声明启用或禁用
  #nullable enable
  ```

  

* 列表类型

## 运算符

* `??`: null-coalescing operator
* `?.`: null-conditional operator

## 操作符

* `sizeof()`
* `default()`

## I/O

* Console

  * 常规写法

  ```c#
  using System;
  
  Console.Write();
  Console.WriteLine();
  
  Console.Read();
  Console.ReadLine();
  ```

  * 简化写法

  ```c#
  using static System.Console;
  
  Write();
  WriteLine();
  
  Read();
  ReadLine();
  ```

  * **key input**

  ```c#
  Write("Press any key combination: ");
  ConsoleKeyInfo key = ReadKey();
  WriteLine();
  WriteLine("Key: {0}, Char: {1}, Modifiers: {2}",
      arg0: key.Key,
      arg1: key.KeyChar,
      arg2: key.Modifiers);
  ```

  

