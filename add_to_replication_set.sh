#!/bin/bash
while getopts s: flag
do
    case "${flag}" in
        s) schema_name=${OPTARG};;
    esac
done

. $(dirname "$0")/primarydb.conf

function add_to_replication_set(){
    PGPASSWORD=$database_password psql -h $database_hostname -p $database_port -U $database_user -d $database_name << EOF
    SELECT pglogical.replication_set_add_all_tables('$schema_name', ARRAY['$schema_name']);
EOF
}

add_to_replication_set