#!/bin/bash
while getopts s: flag
do
    case "${flag}" in
        s) schema_name=${OPTARG};;
    esac
done

./create_replication_set.sh -s ${schema_name}
./add_to_replication_set.sh -s ${schema_name}