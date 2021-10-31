# Basic Aggregation

## `$match`

```json
{ $match: { <query> } }
```

* `$match` uses the MongoDB query language query operators to express queries

* A `$match` stage may contain a `$text`query operator, but it must be the first stage in a pipeline
* `$match` should come early in an aggregation pipeline
* cannot use `$where` with `$match`
* `$match` uses the same query syntax as find

## `$project`

```json
{ $project: { <specification(s)> } }
```

* Once we specify one field to retain, we must specify all fields we want to retain.(except `_id`)
* Beyond simply removing and retaining fields, `$project` lets us **add new fields**
* `$project`can be used as many times as required within an Aggregation pipeline
* `$project` can be used to reassign values to existing field names and to derive entirely new fields

# Core Aggregation

## `$group`

* `_id` is where to specify what incoming documents should be grouped on
* Can use all accumulator expressions within `$group`
* `$group` can be used multiple times within a pipeline
* It may be necessary to sanitize incoming data

## `$unwind`

```json
{ $unwind: <field path> }
```



* `$unwind` only works on array values
* There are two forms for unwind, short form and long form
* Using unwind on large collections with big documents may lead to performance issue

## `$lookup`

```json
{
   $lookup:
     {
       from: <collection to join>,
       localField: <field from the input documents>,
       foreignField: <field from the documents of the "from" collection>,
       as: <output array field>
     }
}
```



* The from collection cannot be shared
* The from collection must be in the same database
* The values in `localField` and `foreignField` are matched on equality
* `as` can be any names, but if it exists in the working document that field will be overwritten

## `$bucket`

* Must always specify at least 2 values to **boundaries**
* **boundaries** must all be of the same general type
* **count** is inserted by default with no **output**, but removed when **output** is specified

## `$bucketAuto`

* Cardinality of **groupBy** expression may impact even distribution and number of buckets
* Specifying a **granularity** requires the expression to **groupBy** to resolve to a numeric value

## `$sortByCount`

*  Is equivalent to a group stage to count occurence, and then sorting in descending order

# Miscellaneous Aggregation

## [$redact](https://docs.mongodb.com/manual/reference/operator/aggregation/redact/)

* `$$KEEP` and `$$PRUNE` automatically apply to all levels below the evaluated level
* `$$DESCEND` retains the current level and evaluates the next level down
* `$redact` is not for restricting access to a collection

## [$out](https://docs.mongodb.com/manual/reference/operator/aggregation/out/)

* Will create a new collection or overwrite an existing collection if specified
* Honors indexes on existing collections
* Will not create or overwrite data if pipeline errors
* Create collections in the same databases as the source collection
* `$out` must be the last stage in a pipeline, and is not allowed within a `$facet` stage

## [$merge](https://docs.mongodb.com/manual/reference/operator/aggregation/merge/)

`$merge` allows us to :

* output the documents from an Aggregation Pipeline to a collection in the same or different database.

* output the documents from an Aggregation Pipeline to a *sharded* collection.
* merge documents from an Aggregation and the target collection - we can even specify *how* we want these documents to be merged.

```json
{ $merge: {
     into: <collection> -or- { db: <db>, coll: <collection> },
     on: <identifier field> -or- [ <identifier field1>, ...],  // Optional
     let: <variables>,                                         // Optional
     whenMatched: <replace|keepExisting|merge|fail|pipeline>,  // Optional
     whenNotMatched: <insert|discard|fail>                     // Optional
} }
```

## Views

* Views contain no data themselves. They are created on demand and reflect the data in the source collection
* Views are read only. Write Operations to Views will error
* Views have some restrictions:
  * No write operations
  * No mapReduce
  * No index operations
  * No `$text`
  * No renaming
  * No geoNear or `$geoNear`
  * Collation restrictions
  * `find()` operations with projection operators are not permitted:
    * `$`
    * `$elemMatch`
    * `$slice`
    * `$meta`

* Horizontal slicing is performed with the `$match` stage, reducing the number of documents that are returned
* Vertical slicing is performed with `$project` or other shaping stage, modifing individual documents



# Aggregation Performance and Pipeline Optimization

## Performance

"Realtime" Processing:

* Provide data for *applications*
* Query performance is *more important*

Batch Processing:

* Provide data for *analytics*
* Query performance is *less important*



### Memory Constraints

* Results are subject to **16MB** document limit
  * Use `$limit` and `$project`
* **100MB** of RAM per stage
  * Use indexes
  * `db.orders.aggregate([...], {allowDiskUse: true}) `
    * Doesn't work with `$graphLookup`



## Optimization

* Avoid unnecessary stages, the Aggregation Framework can project fields automatically if final shape of the output document can be determined from initial input.
* Use accumulator expressions, `$map`, `$reduce` and `$filter` in project before an `$unwind` if possible
* Every high order array function can be implemented with `$reduce` if the provided expressions do not meet your needs.

