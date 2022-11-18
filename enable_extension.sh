#!/bin/bash
source /home/ruween/pglogical-dbreplication-automation/primarydb.conf

function enable_extension(){
    PGPASSWORD=$database_password psql -h $database_hostname -p $database_port -U $database_user -d $database_name << EOF
    CREATE EXTENSION pglogical;
EOF
}