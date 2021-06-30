## 基础知识

* 在关系数据库中，数据库表是一系列二维数组的集合，用来存储数据和操作数据的逻辑结构。它由纵向的列和横向的行组成。行被称为**记录**，是组织数据的单位；列被称为**字段**，每一列表示记录的一个属性，有相应的描述信息，如数据类型、数据宽度等。

* 数据库系统有3个主要的组成部分。

  * 数据库：用于存储数据的地方。
  * 数据库管理系统：用于管理数据库的软件, 能定义数据存储结构，提供数据的操作机制，维护数据库的安全性、完整性和可靠性。
  * 数据库应用程序：为了提高数据库系统的处理能力所使用的管理数据库的软件补充, 负责与DBMS进行通信，访问和管理DBMS中存储的数据，允许用户插入、修改、删除DB中的数据

* SQL语言包含以下4部分。

  * （1）数据定义语言（DDL）：DROP、CREATE、ALTER等语句。
  * （2）数据操作语言（DML）：INSERT（插入）、UPDATE（修改）、DELETE（删除）语句。
  * （3）数据查询语言（DQL）：SELECT语句。
  * （4）数据控制语言（DCL）：GRANT、REVOKE、COMMIT、ROLLBACK等语句。

* 数据库访问接口:

  * ODBC: Open DataBase Connectivity
  * JDBC: Java DataBase Connectivity
  * ADO.NET
  * PDO: PHP Data Object

* MySQL命名机制由3个数字和1个后缀组成，例如：MySQL-8.0.13版本:

  * （1）第1个数字（8）是主版本号，描述了文件格式，所有版本8的发行版都有相同的文件格式。
  * （2）第2个数字（0）是发行级别，主版本号和发行级别组合在一起便构成了发行序列号。
  * （3）第3个数字（13）是在此发行系列的版本号，随每次新分发版本递增。通常选择已经发行的最新版本。

* MySQL 8的新特性

  * 数据字典: 用于存储有关数据库对象的信息
  * 原子数据定义语句(DDL-Data Definition Language)
  * 安全和账户管理(支持角色,允许账户双密码, 维护密码历史)
  * 资源组的创建和管理
  * 增强InnoDB
  * 默认字符集更改为`utf8mb4`
  * 增强JSON
    * 添加`->>`运算符
    * 添加两个JSON聚合函数`JSON_ARRAYAGG()`和`JSON_OBJECTAGG()`
    * 添加输出函数`JSON_PRETTY()`
    * 添加合并函数`JSON_MERGE_PATCH()`
  * 支持将表达式用作数据类型的默认值，包括BLOB、TEXT、GEOMETRY和JSON数据类型
  * 新增窗口函数
  * 实现了统计直方图

* 登录命令:`mysql -h <host> -u <user> -p`

* Linux平台MySQL安装目录

  | 文件夹             | 内容                         |
  | ------------------ | ---------------------------- |
  | /usr/bin           | 客户端和脚本                 |
  | /usr/sbin          | mysqld服务器                 |
  | /var/lib/mysql     | 日志文件和数据库             |
  | /usr/share/info    | 信息格式手册                 |
  | /usr/share/man     | UNIX帮助页                   |
  | /usr/include/mysql | 头文件                       |
  | /usr/lib/mysql     | 库                           |
  | /usr/share/mysql   | 错误消息,字符集,示例配置文件 |

## 数据库的基本操作

```mysql
SHOW DATABASES;
SHOW CREATE DATABASE database_name;

CREATE DATABASE database_name;
DROP DATABASE database_name;

SELECT DISTINCT(ENGINE) FROM information_schema.tables;

USE database_name;
```

## 数据表的基本操作

```mysql

```

