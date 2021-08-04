#!/bin/bash
# Environment variables necessary for Oracle Instant Client
export LD_LIBRARY_PATH=/home/tomcat/scripts/instantclient_11_2
export PATH=$PATH:$LD_LIBRARY_PATH

function check_db {
  CONNECTION=$1
  RETVAL=`sqlplus -silent $CONNECTION <<EOF
SET PAGESIZE 0 FEEDBACK OFF VERIFY OFF HEADING OFF ECHO OFF
SELECT 'Alive' FROM dual;
EXIT;
EOF`

  if [ "$RETVAL" = "Alive" ]; then
    DB_OK=0
  else
    DB_OK=1
  fi
}
