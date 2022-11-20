#!/bin/bash
while getopts s: flag
do
    case "${flag}" in
        s) schema_name=${OPTARG};;
    esac
done

./create_subscription.sh -s ${schema_name}