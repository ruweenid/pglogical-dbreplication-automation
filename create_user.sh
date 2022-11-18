#!/bin/bash
source /home/ruween/pglogical-dbreplication-automation/primarydb.conf

function create_user (){
    PGPASSWORD=$database_password psql -h $database_hostname -p $database_port -U $database_user -d $database_name << EOF
    CREATE USER pguser WITH PASSWORD '$pglogical_password';
    ALTER USER pguser LOGIN;
    GRANT rds_superuser TO pguser;
EOF
echo "[INFO] $(date) pguser creation script completed"
}

