# Atlas

* *Replica Set* - a few connected machines that store the same data to ensure that if something happens to one of the machines the data will remain intact. Comes from the word replicate - to copy something.

* *Instance* - a single machine locally or in the cloud, running a certain software, in our case it is the MongoDB database.

* *Cluster* - group of servers that store your data.



# BSON

[JSON and BSON | MongoDB](https://www.mongodb.com/json-and-bson)

[BSON (Binary JSON) Serialization](https://www.mongodb.com/json-and-bson)



# Import & Export

> *SRV connection string* - a specific format used to establish a connection between your application and a MongoDB instance

```bash
# JSON
mongoimport --uri="mongodb+srv://<your username>:<your password>@<your cluster>.mongodb.net/sample_supplies" --drop sales.json

mongoexport --uri="mongodb+srv://<your username>:<your password>@<your cluster>.mongodb.net/sample_supplies" --collection=sales --out=sales.json

# BSON
mongorestore --uri "mongodb+srv://<your username>:<your password>@<your cluster>.mongodb.net/sample_supplies"  --drop dump

mongodump --uri "mongodb+srv://<your username>:<your password>@<your cluster>.mongodb.net/sample_supplies"
```



# mongo Shell

```javascript
show dbs

use <db_name>

show collections

it // iterates through a cursor
```

* `cursor`: A pointer to a result set of a query
* `pointer`: A direct address of the memory location

# CRUD

## Create

### `insert()`

```javascript
db.<collection_name>.insert({"field": "value"})
```



## Delete

### `deleteOne()`

### `deleteMany()`

### `drop()`

## Update

[Update Operators — MongoDB Manual](https://docs.mongodb.com/manual/reference/operator/update/#id1)

### `updateOne()`

### `updateMany()`

## Read

### `find()`

```javascript
db.<collection_name>.find({field: "value"}).count()

db.<collection_name>.find({field1: "value1", field2: "value2"})

db.<collection_name>.find({field1: "value1", field2: "value2"}).pretty()
```

### `findOne()`

```javascript
db.<collection_name>.findOne();
```



## Query Operators

### Comparison

### Logic

### Expressive

### Array