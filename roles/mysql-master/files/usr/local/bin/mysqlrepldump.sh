#!/bin/sh

set -e

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

CMD=mysqldump
ARG="$@ --single-transaction --master-data=1 --databases"

for DB in `find /etc/mysql -type f -name '*.cnf' | xargs grep ^binlog-do-db | awk '{print $3}'`; do
  ARG="$ARG $DB"
done

for IGNORE_TABLE in `find /etc/mysql -type f -name '*.cnf' | xargs grep ^replicate-ignore-table | awk '{print $3}'`; do
  ARG="$ARG --ignore-table=$IGNORE_TABLE"
done

$CMD $ARG
