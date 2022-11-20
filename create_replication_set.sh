#!/bin/bash
while getopts s: flag
do
    case "${flag}" in
        s) schema_name=${OPTARG};;
    esac
done

. $(dirname "$0")/primarydb.conf

function create_replication_set(){
    PGPASSWORD=$database_password psql -h $database_hostname -p $database_port -U $database_user -d $database_name << EOF
    SELECT pglogical.create_replication_set('$schema_name');
EOF
}

create_replication_set