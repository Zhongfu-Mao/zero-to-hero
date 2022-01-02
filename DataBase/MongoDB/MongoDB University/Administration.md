# Administration

## mongod

> A daemon is a program or process that's meant to be run but not interacted with directly.  

* mongod is the main daemon process for MongoDB.
* It is the **core server** of the database, handling connections, requests, and most importantly, persisting data.

### default configuration

* port: 27017 -> `mongod --port <port number>`
* dbpath: `/data/db` -> `mongod --dbpath <directory path>`
* auth: false -> `mongod --auth`
* bound to localhost(127.0.0.1) -> `mongod --bind_ip <ip address>[, <ip address>...]`

### commands group

* `db.<method>()`
  * `db.<collection>.<method>()`
* `rs.<method>()`
* `sh.<method>()`

### command line

[🔗mongod command line options](https://docs.mongodb.com/manual/reference/program/mongod/#options)

### configuration file

[🔗mongod configuration file options](https://docs.mongodb.com/manual/reference/configuration-options/)

```yaml
# mongod.conf
storage:
  dbPath: "/data/db"
systemLog:
  path: "/data/log/mongod.log"
  destination: "file"
replication:
  replSetName: M103
net:
  bindIp : "127.0.0.1,192.168.103.100"
tls:
  mode: "requireTLS"
  certificateKeyFile: "/etc/tls/tls.pem"
  CAFile: "/etc/tls/TLSCA.pem"
security:
  keyFile: "/data/keyfile"
processManagement:
  fork: true
```

### logging

Log Verbosity Levels:

* -1: Inherit from parent
* 0: Default Verbosity, to include informational messages
* 1-5: Increase the verbosity level to include Debug messages

Log Message Severity Levels:

* F - Fatal
* E - Error
* W - Warning
* I - Informational(Verbosity Level 0)
* D - Debug(Verbosity Level 1-5)

### Basic Security

Authentication:

* SCRAM and X.509 are always available
* LDAP and KERBEROS are Enterprise-Only

Authorization: Role Based Access Control

* Each user has a set of **roles**.
* Each role has a set of **privileges**.
* A privilege is a permission to perform a specific operation on a specific resource.

### Built-in Roles

* Database User
  * read
  * readWrite
* Database Administration
  * dbAdmin
  * userAdmin
  * dbOwner
* Cluster Administration
  * clusterAdmin
  * clusterManager
  * clusterMonitor
  * hostManager
* Backup/Restore
  * backup
  * restore
* Super User
  * root

#### Create user

```shell
db.createUser(
  { user: "dba",
    pwd: "c1lynd3rs",
    roles: [ { db: "admin", role: "dbAdmin" } ]
  }
)
```

#### Grant role to user

```shell
db.grantRolesToUser( "dba",  [ { db: "playground", role: "dbOwner"  } ] )
```

#### Show role privileges

```shell
db.runCommand( { rolesInfo: { role: "dbOwner", db: "playground" }, showPrivileges: true} )
```

### Server Tools

List mongodb binaries: `find /usr/bin/ -name "mongo*"`

#### mongostat

```shell
mongostat --host <host> --port <port>
```

#### mongorestore

> restore a MongoDB collection from a BSON dump file

```shell
mongorestore --host <host> --port <port> --db <db> --drop --dir <directory>

# exp:
mongorestore --drop --port 30000 dump/
```

#### mongodump

> get a BSON dump of a MongoDB collection

```shell
mongodump --host <host> --port <port> --db <db> --out <directory>

# exp:
mongodump --help
mongodump --port 30000 --db applicationData --collection products
ls dump/applicationData/
cat dump/applicationData/products.metadata.json
```

#### mongoexport

> export a MongoDB collection to JSON or CSV (or stdout!)

```shell
mongoexport --host <host> --port <port> --db <db> --collection <collection> --out <file>

# exp:
mongoexport --help
mongoexport --port 30000 --db applicationData --collection products
mongoexport --port 30000 --db applicationData --collection products -o products.json
```

Differences between `mongoexport` and `mongodump`:

* mongoexport exports the **entire collection**, whereas mongodump exports **only the documents**.
* By default, mongoexport sends output to standard output, but mongodump writes to a file.
* mongodump can create a data file and a metadata file, but mongoexport just creates a data file.
* mongodump outputs **BSON**, but mongoexport outputs **JSON**.

#### mongoimport

> create a MongoDB collection from a JSON or CSV file

```shell
mongoimport --host <host> --port <port> --db <db> --collection <collection> --file <file>

# exp:
mongoimport --port 27000 -u m103-application-user -p m103-application-pass --db applicationData --collection products --file /dataset/products.json --authenticationDatabase admin
```

## Replication

### Instructions to set up a replica set

* The configuration file for the first node (node1.conf):

```yaml
storage:
  dbPath: /var/mongodb/db/node1
net:
  bindIp: 192.168.103.100,localhost
  port: 27011
security:
  authorization: enabled
  keyFile: /var/mongodb/pki/m103-keyfile
systemLog:
  destination: file
  path: /var/mongodb/db/node1/mongod.log
  logAppend: true
processManagement:
  fork: true
replication:
  replSetName: m103-example
```

* Creating the keyfile and setting permissions on it:

```shell
sudo mkdir -p /var/mongodb/pki/
sudo chown vagrant:vagrant /var/mongodb/pki/
openssl rand -base64 741 > /var/mongodb/pki/m103-keyfile
chmod 400 /var/mongodb/pki/m103-keyfile
```

* Creating the dbpath for node1:

```shell
mkdir -p /var/mongodb/db/node1
```

* Starting a mongod with node1.conf:

```shell
mongod -f node1.conf
```

* Copying node1.conf to node2.conf and node3.conf:

```shell
cp node1.conf node2.conf
cp node2.conf node3.conf
```

* Editing node2.conf and node3.conf:

```yaml
storage:
  dbPath: /var/mongodb/db/node2 # edited
net:
  bindIp: 192.168.103.100,localhost
  port: 27012 # edited
security:
  keyFile: /var/mongodb/pki/m103-keyfile
systemLog:
  destination: file
  path: /var/mongodb/db/node2/mongod.log # edited
  logAppend: true
processManagement:
  fork: true
replication:
  replSetName: m103-example
```

```yaml
storage:
  dbPath: /var/mongodb/db/node3 # edited
net:
  bindIp: 192.168.103.100,localhost
  port: 27013 # edited
security:
  keyFile: /var/mongodb/pki/m103-keyfile
systemLog:
  destination: file
  path: /var/mongodb/db/node3/mongod.log # edited
  logAppend: true
processManagement:
  fork: true
replication:
  replSetName: m103-example
```

```yaml
storage:
  dbPath: /var/mongodb/db/node4
net:
  bindIp: 192.168.103.100,localhost
  port: 27014
systemLog:
  destination: file
  path: /var/mongodb/db/node4/mongod.log
  logAppend: true
processManagement:
  fork: true
replication:
  replSetName: m103-example
```

```yaml
storage:
  dbPath: /var/mongodb/db/arbiter
net:
  bindIp: 192.168.103.100,localhost
  port: 28000
systemLog:
  destination: file
  path: /var/mongodb/db/arbiter/mongod.log
  logAppend: true
processManagement:
  fork: true
replication:
  replSetName: m103-example
```

* Creating the data directories for node2 and node3:

```shell
mkdir /var/mongodb/db/{node2,node3}
```

* Starting mongod processes with node2.conf and node3.conf:

```shell
mongod -f node2.conf
mongod -f node3.conf
mongod -f node4.conf
mongod -f arbiter.conf
```

* Connecting to node1:

```shell
mongo --port 27011
```

* Initiating the replica set:

```shell
rs.initiate()
```

* Creating a user:

```shell
use admin
db.createUser({
  user: "m103-admin",
  pwd: "m103-pass",
  roles: [
    {role: "root", db: "admin"}
  ]
})
```

* Exiting out of the Mongo shell and connecting to the entire replica set:

```shell
exit
mongo --host "m103-example/192.168.103.100:27011" -u "m103-admin"
-p "m103-pass" --authenticationDatabase "admin"
```

* Getting replica set status:

```shell
rs.status()
```

* Adding other members to replica set:

```shell
rs.add("m103:27012") # m103 stands for hostname
rs.add("m103:27013")
rs.add("m103:27014")
rs.addArb("m103:28000")
```

* Getting an overview of the replica set topology:

```shell
rs.isMaster()
```

* Stepping down the current primary:

```shell
rs.stepDown()
```

* Checking replica set overview after election:

```shell
rs.isMaster()
```

* Assigning the current configuration to a shell variable we can edit, in order to reconfigure the replica set:

```shell
cfg = rs.conf()
```

* Editing our new variable cfg to change topology - specifically, by modifying cfg.members:

```shell
cfg.members[3].votes = 0
cfg.members[3].hidden = true
cfg.members[3].priority = 0
```

* Updating our replica set to use the new configuration cfg:

```shell
rs.reconfig(cfg)
```

### Replication Commands

* `rs.status()`
  * Report health on replica set nodes
  * Uses data from heartbeats
* `rs.isMaster()`
  * Describes a node's role in the replica set
  * Shorter output than `rs.status()`
* `db.serverStatus()['repl']`
  * Section of `db.serverStatus()` that describes replica set status
  * Similar to the output of `rs.isMaster()`
* `rs.printReplicationInfo()`
  * Only returns oplog data relative to current node
  * Contains timestamps for first and last oplog events

### Local DB

* Display collections from the local database (this displays more collections from a replica set than from a standalone node):

```shell
use local
show collections
```

* Query the oplog after connected to a replica set:

```shell
use local
db.oplog.rs.find()
```

* Store oplog stats as a variable called stats:

```shell
var stats = db.oplog.rs.stats()
```

* Verify that this collection is capped (it will grow to a pre-configured size before it starts to overwrite the oldest entries with newer ones):

```shell
stats.capped
```

* Get current size of the oplog:

```shell
stats.size
```

* Get size limit of the oplog:

```shell
stats.maxSize
```

* Get current oplog data (including first and last event times, and configured oplog size):

```shell
rs.printReplicationInfo()
```
