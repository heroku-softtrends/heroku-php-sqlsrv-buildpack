#!/bin/bash

export ODBCINI=${HOME}/.apt/usr/lib/odbc/conf/

echo "[ODBC Driver 17 for SQL Server]
Description=Microsoft ODBC Driver 17 for SQL Server
Driver=/app/.apt/usr/lib/libmsodbcsql-17.6.so.1.1
UsageCount=1
" > ${ODBCINI}/odbc.ini

export ODBCSYSINI=${HOME}/.apt/usr/lib/odbc/conf/

echo "[ODBC Driver 17 for SQL Server]
Description=Microsoft ODBC Driver 17 for SQL Server
Driver=/app/.apt/usr/lib/libmsodbcsql-17.6.so.1.1
" > ${ODBCSYSINI}/odbcinst.ini
