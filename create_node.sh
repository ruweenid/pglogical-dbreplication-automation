#!/bin/bash
source /home/ruween/pglogical-dbreplication-automation/primarydb.conf

function create_node(){
    PGPASSWORD=$database_password psql -h $database_hostname -p $database_port -U $database_user -d $database_name << EOF
        SELECT pglogical.create_node( node_name := '$node_name', dsn := 'host=$database_hostname port=5432 dbname=$database_name user=pguser password=$database_password');
EOF
}
