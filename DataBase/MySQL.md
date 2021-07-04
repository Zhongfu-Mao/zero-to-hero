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

### 创建

```mysql
CREATE TABLE <表名>
(
  	字段名1 数据类型[列级别约束条件] [默认值],
  	字段名2 数据类型[列级别约束条件] [默认值],
  	......
  	[表级别约束条件]
);

CREATE TABLE tb_emp
(
  	id INT(11) PRIMARY KEY AUTO_INCREMENT, # 定义的同时指定主键
  	name VARCHAR(25) NOT NULL,
  	deptId INT(11),
  	salary FLOAT
);

CREATE TABLE tb_emp2
(
  	id INT(11),
  	name VARCHAR(25) UNIQUE,
  	deptId INT(11),
  	salary FLOAT,
  	PRIMARY KEY(id) # 定义完所有列之后指定主键
);

CREATE TABLE tb_emp3
(
  	id INT(11),
  	name VARCHAR(25),
  	deptId INT(11) DEFAULT 1111,
  	salary FLOAT,
  	PRIMARY KEY(name, deptID) # 多字段联合主键
);
```

> 外键:
>
> * 用来在两个表的数据之间建立连接，可以是一列或者多列。
>
> * 外键是另一个表的主键
>
> * 一个表可以有一个或多个外键。
>
> * 外键对应的是参照完整性，一个表的外键可以为空值，若不为空值，则每一个外键值必须等于另一个表中主键的某个值。
>
> * 不可以是本表的主键
>
> * 定义后,不允许删除在另一个表中具有关联关系的行
>
> * ```mysql
>   [CONSTRAINT <外键名>] FOREIGN KEY 字段名1 [, 字段名2,..]
>   REFERENCES <主表名> 主键列1 [, 主键列2, ...]
>   ```

### 查看

```mysql
DESCRIBE 表名;
DESC 表名; # 简写
```

* NULL：表示该列是否可以存储NULL值。
* Key：表示该列是否已编制索引。
  * PRI表示该列是表主键的一部分；
  * UNI表示该列是UNIQUE索引的一部分；
  * MUL表示在列中某个给定值允许出现多次。
* Default：表示该列是否有默认值，有的话指定值是多少。
* Extra：表示可以获取的与给定列有关的附加信息，例如AUTO_INCREMENT等。

```mysql
SHOW CREATE TABLE <表名\G>;
```

* 使用`SHOW CREATE TABLE`语句，不仅可以查看表创建时候的详细语句，还可以查看存储引擎和字符编码
* 如果不加`\G`参数，显示的结果可能非常混乱，加上之后，可使显示结果更加直观，易于查看

```mysql
SHOW TABLES; # 查看数据库中所有的表
```

### 修改

```mysql
# 修改表名
ALTER TABLE <旧表名> RENAME [TO] <新表名>; # TO加不加都一样

# 修改字段的数据类型
ALTER TABLE <表名> MODIFY <字段名> <数据类型>;

# 修改字段名
ALTER TABLE <表名> CHANGE <旧字段名> <新字段名> <新数据类型>;

# 添加字段
ALTER TABLE <表名> ADD <新字段名> <数据类型> [约束条件] [FIRST | AFTER 已存在字段名];
# `[FIRST | AFTER 已存在字段名]`用于指定位置,如果没有指定默认添加到最后

# 删除字段
ALTER TABLE <表名> DROP <字段名>;

# 修改字段的排列位置
ALTER TABLE <表名> MODIFY <字段1> <数据类型> FIRST|AFTER <字段2>;

# 更改表的存储引擎
ALTER TABLE <表名> ENGINE=<更改后的存储引擎名>;

# 删除表的外键约束
ALTER TABLE <表名> DROP FOREIGN KEY <外键约束名>;
```

### 删除

```mysql
# 删除没有被关联的表
DROP TABLE [IF EXISTS]表1[, 表2, ...表n];

# 删除被其他表关联的主表
# 解除关联子表的外键约束
ALTER TABLE <子表名> DROP FOREIGN KEY <父表名>;
# 删除父表
DROP TABLE <父表名>;
```

## 数据类型和运算符

### 数据类型

MySQL支持多种数据类型，主要有数值类型、日期/时间类型和字符串类型。

* 数值类型：
  * 整数类型
    * TINYINT(4): 1字节
    * SMALLINT(6): 2字节
    * MEDIUMINT(9): 3字节
    * INT(11): 4字节
    * BIGINT(20): 8字节
  * 浮点小数数据类型(M, N)
    * FLOAT: 4字节
    * DOUBLE: 8字节
  * 定点小数类型(M为精度, 表示总共的位数; N为标度, 表示小数的位数)
    * DECIMAL: M+2字节

> 数据类型后面加括号,里面的数字表示**显示宽度**
>
> 和Python的format格式里面的宽度类似,如果超过了显示宽度依旧可以显示
>
>  
>
> 在MySQL中，定点数以字符串形式存储，在对精度要求比较高的时候（如货币、科学数据等）使用DECIMAL的类型比较好，另外两个浮点数进行减法和比较运算时容易出问题，所以在使用浮点数时需要注意，并尽量避免做浮点数比较。

* 日期/时间类型

| 类型名称  | 日期格式            | 日期范围                                          | 存储要求 |
| --------- | ------------------- | ------------------------------------------------- | -------- |
| YEAR      | YYYY                | 1901~2155                                         | 1字节    |
| TIME      | HH:MM:SS            | -838:59:59~838:59:59                              | 3字节    |
| DATE      | YYYY-MM-DD          | 1000-01-01~9999-12-31                             | 3字节    |
| DATETIME  | YYYY-MM-DD HH:MM:SS | 1000-01-01 00:00:00 ~9999-12-31 23:59:59          | 8字节    |
| TIMESTAMP | YYYY-MM-DD HH:MM:SS | 1970-01-01 00:00:01 UTC ~ 2038-01-19 03:14:07 UTC | 4字节    |

* 字符串类型

| 类型名称   | 说明                                        | 存储要求                                        |
| ---------- | ------------------------------------------- | ----------------------------------------------- |
| CHAR(M)    | 固定长度非二进制字符串                      | M字节,1<=M<=255                                 |
| VARCHAR(M) | 变长非二进制字符串                          | L+1字节, L<=M,1<=M<=255                         |
| TINYTEXT   | 非常小的非二进制字符串                      | L+1字节,L<2^8                                   |
| TEXT       | 小的非二进制字符串                          | L+2字节,L<2^16                                  |
| MEDIUMTEXT | 中等大小的非二进制字符串                    | L+3字节,L<2^24                                  |
| LONGTEXT   | 大的非二进制字符串                          | L+4字节, L<2^32                                 |
| ENUM       | 枚举类型,只能有一个枚举字符串值             | 1或2字节,取决于枚举值的数目(最大65535)          |
| SET        | 一个设置, 字符串对象可以有零个或多个SET成员 | 1, 2, 3, 4或8字节, 取决于集合成员的数量(最多64) |

| 类型名称      | 说明                 | 存储要求        |
| ------------- | -------------------- | --------------- |
| BIT(M)        | 位字段类型           | 大约(M+7)/8字节 |
| BINARY(M)     | 固定长度二进制字符串 | M字节           |
| VARBINARY(M)  | 可变长度二进制字符串 | M+1字节         |
| TINYBLOB(M)   | 非常小的BLOB         | L+1字节,L<2^8   |
| BLOB(M)       | 小BLOB               | L+2字节,L<2^16  |
| MEDIUMBLOB(M) | 中等大小BLOB         | L+3字节,L<2^24  |
| LONGBLOB(M)   | 大BLOB               | L+4字节,L<2^32  |

> BLOB是一个二进制大对象，用来存储可变数量的数据, 主要用来存储图片,音频信息等
>
>  
>
> BLOB列存储的是二进制字符串（字节字符串），TEXT列存储的是非二进制字符串（字符字符串）。BLOB列没有字符集，并且排序和比较基于列值字节的数值；TEXT列有一个字符集，并且根据字符集对值进行排序和比较。

### 运算符

* 算术运算符
  * `+`
  * `-`
  * `*`
  * `/`
  * `%`
* 比较运算符(结果总是1,0或NULL)
  * `>`
  * `<`
  * `=`
  * `<=>`(安全等于,可以用来判断NULL)
  * `>=`
  * `<=`
  * `!=`或`<>`
  * `IN`,`NOT IN`
  * `BETWEEN min AND max`
  * `IS NULL`,`ISNULL`,`IS NOT NULL`
  * `GREATEST`
  * `LEAST`
  * `LIKE`
    * `%`匹配任何数目的字符包括零字符
    * `_`只匹配一个字符
  * `REGEXP`
* 逻辑运算符(结果总是TRUE,FALSE或NULL)
  * `NOT`或者`!`
  * `AND`或者`&&`
  * `OR`或者`||`
  * `XOR`
* 位运算符
  * `&`
  * `|`
  * `~`
  * `^`
  * `<<`
  * `>>`

## 函数

### 数学函数

* ABS(X)
* PI()
* SQRT(X)
* MOD(X, Y)
* CEIL(X), CEILING(X)
* FLOOR(X)
* RAND(), RAND(X)
* ROUND(X), ROUND(X,Y), TRUNCATE(X,Y)
* SIGN(X)
* POW(X, Y), POWER(X,Y)
* EXP(X)
* LOG(X),LOG10(X)
* RADIANS(X),DEGREES(X)
* SIN(X),ASIN(X)
* COS(X),ACOS(X)
* TAN(X),ATAN(X)

### 字符串函数

* CHAR_LENGTH(str)
* LENGTH(str)
* CONCAT(s1,s2,...), CONCAT_WS(x,s1,s2,...)
* INSERT(s1,x,len,s2)
* LOWER(str),LCASE(str)
* UPPER(str),UCASE(str)
* LEFT(s, n), RIGHT(s, n)
* LPAD(s1, len, s2), RPAD(s1, len, s2)
* LTRIM(s),RTRIM(s),TRIM(s)
* TRIM(s1 FROM s)
* REPEAT(s, n)
* SPACE(n),REPLACE(s,s1,s2)
* STRCMP(s1, s2)
* SUBSTRING(s, n, len), MID(s, n, len)
* LOCATE(str1, str), POSITION(str1 IN str), INSTR(str, str1)
* REVERSE(s)
* ELT(N, str1, str2, str3,... strN)
* FIELD(s, s1, s2,...sN)
* FIND_IN_SET(s1, s2)
* MAKE_SET(x, s1, s2,...sN)

### 日期和时间函数

#### 获取

* CURDATE(), CURRENT_DATE()
* CURTIME(), CURRENT_TIME()
* CURRENT_TIMESTAMP(), LOCALTIME(), NOW(), SYSDATE()
* UNIX_TIMESTAMP(), UNIX_TIMESTAMP(date)
* FROM_UNIXTIME(timestamp)
* UTC_DATE()
* UTC_TIME()
* MONTH(date)
* MONTHNAME(date)
* DAYNAME(date), DAYOFWEEK(date), WEEKDAY(date)
* WEEK(date), WEEKOFYEAR(date)
* DAYOFYEAR(date), DAYOFMONTH(date)
* YAER(date)
* QUARTER(date)
* MINUTE(time)
* SECOND(time)
* EXTRACT(type FROM date)
* TIME_TO_SEC(time)
* SEC_TO_TIME(seconds)

#### 计算

* DATE_ADD(date, INTERVAL expr type)
* ADDDATE(date, INTERVAL expr type)
* DATE_SUB(date, INTERVAL expr type)
* SUBDATE(date, INTERVAL expr type)
* ADDTIME(date, expr)
* SUBTIME(date, expr)
* DATE_DIFF(date1, date2)

#### 格式化

* DATE_FORMAT(date, format)
* TIME_FORMAT(time, format)
* GET_FORMAT(val_type, format_type)

### 条件判断函数

* IF(expr, v1, v2)
* IFNULL(v1, v2)
* CASE　WHEN v1 THEN r1 [WHEN v2 THEN r2]… ELSE rn+1] END

### 系统信息函数

* VERSION()
* CONNECTION_ID()
* USER()
* CURRENT_USER()
* SYSTEM_USER()
* SESSION_USER()
* CHARSET(str)
* COLLATION(str)
* LAST_INSERT_ID()

### MySQL 8 新增函数

* MD5(str)
* SHA(str)
* SHA2(str, hash_length)
* window ... AS (ORDER BY ...)

### 其它函数

* FORMAT(x, n)
* CONV(N, from_base, to_base)
* INET_ATON(expr)
* GET_LOCK(str, timeout)
* RELEASE_LOCK(str)
* IS_FREE_LOCK(str)
* IS_USED_LOCK(str)
* BENCHMARK(count, expr)
* CONVERT(... USING ...)
* CAST(x, AS type)
* CONVERT(x, type)

## 查询数据

```mysql
SELECT
	{ * | <字段列表> | DISTINCT 字段名 | 聚合函数() AS 别名}
FROM
	<表1>[,<表2>...]
[WHERE <表达式> [ANY|SOME|ALL|IN|EXISTS 子查询]]
[GROUP BY <字段>]
[HAVING <条件表达式> [{<operator> <expression>}...]]
[ORDER BY <字段列表> [DESC]]
[LIMIT [<位置偏移量>,] <行数> | LIMIT <行数> OFFSET <位置偏移量>]
[UNION [ALL] 别的查询];
```

## 插入,更新和删除

### 插入

```mysql
INSERT INTO
	table_name [(column_list)]
VALUES
	(value_list)[, (value_list2)...];
```

### 更新

```mysql
UPDATE
	table_name
SET
	column_name=value[,column_name2=value2...]
WHERE
	(condition);
```

### 删除

```mysql
DELETE FROM
	table_name
[WHERE (condition)];

TRUNCATE TABLE table_name; # 删除表中所有记录
```

### 为表增加计算列

```mysql
col_name data_type [GENERATED ALWAYS] AS (expression)
	[VIRTUAL | STORED] [UNIQUE [KEY]] [COMMENT comment]
	[NOT NULL | NULL] [[PRIMARY] KEY]
```

> 在MySQL 8.0中，CREAE TABLE和ALTER TABLE中都支持增加计算列

## 索引

> 索引是一个单独的、存储在磁盘上的数据库结构，包含着对数据表里所有记录的引用指针
