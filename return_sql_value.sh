#!/bin/bash
RETVAL=`sqlplus -silent scott/tiger <<EOF
SET PAGESIZE 0 FEEDBACK OFF VERIFY OFF HEADING OFF ECHO OFF
SELECT * FROM emp;
EXIT;
EOF`
if [ -z "$RETVAL" ]; then
  echo "No rows returned from database"
  exit 0
else
  echo $RETVAL
fi
