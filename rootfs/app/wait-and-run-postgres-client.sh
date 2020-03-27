#! /bin/sh

# Wait until the database is ready.

until pg_isready --dbname=${SENZING_DATABASE_URL}
do
   echo "Sleeping 1 second"
   sleep 1
done

# Process the file specified by SENZING_SQL_FILE

psql ${SENZING_DATABASE_URL} --file ${SENZING_SQL_FILE}
