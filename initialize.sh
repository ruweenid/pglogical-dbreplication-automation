#!/bin/bash
. $(dirname "$0")/create_user.sh
. $(dirname "$0")/create_node.sh
. $(dirname "$0")/enable_extension.sh

create_user
enable_extension
create_node