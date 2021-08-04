#!/bin/bash
scriptPath=${0%/*}
source $scriptPath/check_db.sh

CONNECTION="up_check_user/password@//hostname:1523/service"

echo "Wait until DB is up"
check_db $CONNECTION
while [ $DB_OK = 1 ]
do
  echo "DB not up yet. Sleeping for 5 mins (CTRL+C to exit)"
  sleep 300
  check_db $CONNECTION
done

echo "Starting"
echo "DEV: /u01/dev"
/u01/dev/bin/tomcat start
