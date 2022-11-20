#!/bin/bash
while getopts c: flag
do
    case "${flag}" in
        c) configname=${OPTARG};;
    esac
done

./create_user.sh -c ${configname}
./enable_extension.sh -c ${configname}
./create_node.sh -c ${configname}