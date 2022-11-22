#!/bin/bash
while getopts c: flag
do
    case "${flag}" in
        c) configname=${OPTARG};;
    esac
done
. $(dirname "$0")/${configname}db.conf

function create_node(){
    PGPASSWORD=$database_password psql -h $database_hostname -p $database_port -U $database_user -d $database_name << EOF
        SELECT pglogical.create_node( node_name := '$node_name', dsn := 'host=$database_hostname port=5432 dbname=$database_name user=pguser password=$pglogical_password');
EOF
}

create_node