#!/bin/bash
while getopts s: flag
do
    case "${flag}" in
        s) schema_name=${OPTARG};;
    esac
done
. $(dirname "$0")/replicadb.conf


function create_subscription(){
    PGPASSWORD=$database_password psql -h $database_hostname -p $database_port -U $database_user -d $database_name << EOF
    SELECT pglogical.create_subscription(
    subscription_name := '${schema_name}_sub',
    provider_dsn := 'host=$primary_database_hostname port=5432 dbname=$primary_database_name user=pguser password=$primary_pglogical_password',
    replication_sets := ARRAY['$schema_name'],
    synchronize_data := false,
    forward_origins := '{}' );
EOF
echo "[INFO] $(date) ${schema_name}_sub creation statement completed"
}

create_subscription