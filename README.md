
# DB Replication using pglogical Automation Scripts

A collection of shell scripts to automate the configuration of pglogical in Velaris databases



## Usage/Examples
### Initial Setup

Edit the ``primarydb.conf`` file with the connectivity information related to primary database

```shell
### Primary DB Vars ###
pglogical_password= << Enter Password. make sure to escape special characters >>
database_hostname= << Enter DB Hostname >>
database_port=5432
database_user= << Enter Database User >>
database_password= << Enter Password. make sure to escape special characters >>
database_name= << Enter Database Name >>
node_name="node1"
```

Edit the ``relpicadb.conf`` file with the connectivity information related to reporting database
```shell
### Replica DB Vars ###
pglogical_password= << Enter Password. make sure to escape special characters >>
database_hostname= << Enter DB Hostname >>
database_port=5432
database_user= << Enter Database User >>
database_password= << Enter Password. make sure to escape special characters >>
database_name= << Enter Database Name >>
node_name="node2"

### Primary DB Vars ###
primary_pglogical_password= << Enter Password. make sure to escape special characters >>
primary_database_hostname= << Enter DB Hostname >>
primary_database_port=5432
primary_database_user= << Enter Database User >>
primary_database_password= << Enter Password. make sure to escape special characters >>
primary_database_name= << Enter Database Name >>
primary_node_name="node1"
```
First perform the inital configuration on primary database

```shell
$ ./initialize.sh -c primary
```

Then perform the initial configuration on secondary database

```shell
$ ./initialize.sh -c replica
```

### Creating Replication Sets

Execute the following command and provide the schema name you want to replicate as an argument

```shell
$ ./repset.sh -s schema_name
```

### Creating Subscriptions

Execute the following command and provide the schema name you want to subscribe to as argument

```shell
$ ./subscibe.sh -s schema_name
```


