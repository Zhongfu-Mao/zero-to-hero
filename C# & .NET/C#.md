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
* Binary literals and digit separators
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