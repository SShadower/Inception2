#!/bin/bash

service mysql start 

SQL_FILE="mdb.sql"

mysql < "SQL_FILE"

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld