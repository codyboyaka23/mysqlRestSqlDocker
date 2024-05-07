#!/bin/sh
set -o allexport
source /opt/.env
set +o allexport

if [[ ${WITHDUMP} == "true" ]]; then
    mysql -u root -prootpwd -h mysql-server-service --port 3306 mysql_rest_sql_docker < /opt/sql_files/grants.sql
    mysql -u root -prootpwd -h mysql-server-service --port 3306 mysql_rest_sql_docker < /opt/sql_files/dump.sql
fi
