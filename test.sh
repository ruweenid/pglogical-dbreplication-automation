#!/bin/bash
while getopts c: flag
do
    case "${flag}" in
        c) configname=${OPTARG};;
    esac
done
. $(dirname "$0")/${configname}db.conf

echo $database_name