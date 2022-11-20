#!/bin/bash
while getopts c: flag
do
    case "${flag}" in
        c) configname=${OPTARG};;
    esac
done
. $(dirname "$0")/${configname}db.conf

function enable_extension(){
    PGPASSWORD=$database_password psql -h $database_hostname -p $database_port -U $database_user -d $database_name << EOF
    CREATE EXTENSION pglogical;
EOF
}

enable_extension