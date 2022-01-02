# MongoDB vs RDBMS

|          SQL          |           MongoDB            |
| :-------------------: | :--------------------------: |
|       表(Table)       |       集合(Collection)       |
|        行(Row)        |        文档(Document)        |
|      列(Column)       |         字段(Field)          |
|   主键(Primary Key)   |          字段(_id)           |
|      索引(Index)      |         索引(Index)          |
|      视图(View)       |          视图(View)          |
|  表连接(Table Joins)  |      聚合操作($lookup)       |
| 嵌套表(Embeded Table) | 嵌入式文档(Embeded Document) |
|      数组(Array)      |         数组(Array)          |

|              | MongoDB                                                      | RDBMS                  |
| ------------ | ------------------------------------------------------------ | ---------------------- |
| 数据模型     | 文档模型                                                     | 关系模型               |
| 数据库类型   | OLTP                                                         | OLTP                   |
| CRUD操作     | MQL/SQL                                                      | SQL                    |
| 高可用       | 复制集                                                       | 集群模式               |
| 横向扩展能力 | 通过原生分片                                                 | 数据分区或者应用侵入式 |
| 索引支持     | B-树, 全文索引, 地理位置索引,<br />多键(multikey)索引, TTL索引 | B树                    |
| 开发难度     | 容易                                                         | 困难                   |
| 数据容量     | 没有理论上限                                                 | 千万, 亿               |
| 扩展方式     | 垂直扩展+水平扩展                                            | 垂直扩展               |

# 