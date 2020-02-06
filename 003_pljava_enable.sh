##!/bin/bash

# create extension timescaledb in initial databases
#psql -U "${POSTGRES_USER}" postgres -c "SET pljava.libjvm_location TO '/usr/lib/jvm/default-jvm/lib/server/libjvm.so';"
psql -U "${POSTGRES_USER}" postgres -c "SET pljava.libjvm_location TO '/usr/lib/jvm/default-jvm/lib/server/libjvm.so'; ALTER DATABASE postgres SET pljava.libjvm_location TO '/usr/lib/jvm/default-jvm/lib/server/libjvm.so'; CREATE EXTENSION IF NOT EXISTS pljava CASCADE;"
psql -U "${POSTGRES_USER}" template1 -c "SET pljava.libjvm_location TO '/usr/lib/jvm/default-jvm/lib/server/libjvm.so'; ALTER DATABASE template1 SET pljava.libjvm_location TO '/usr/lib/jvm/default-jvm/lib/server/libjvm.so'; CREATE EXTENSION IF NOT EXISTS pljava CASCADE;"

if [ "${POSTGRES_DB:-postgres}" != 'postgres' ]; then
  psql -U "${POSTGRES_USER}" "${POSTGRES_DB}" -c "SET pljava.libjvm_location TO '/usr/lib/jvm/default-jvm/lib/server/libjvm.so'; ALTER DATABASE ${POSTGRES_DB} SET pljava.libjvm_location TO '/usr/lib/jvm/default-jvm/lib/server/libjvm.so'; CREATE EXTENSION IF NOT EXISTS pljava CASCADE;"
fi
