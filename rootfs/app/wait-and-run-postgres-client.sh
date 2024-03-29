#!/bin/sh

# Wait until the database is ready.

until pg_isready --dbname=${SENZING_DATABASE_URL}
do
    echo "Sleeping 1 second"
    sleep 1
done

# If specified, process single SENZING_SQL_FILE.

if [ -n "${SENZING_SQL_FILE}" ]; then
    echo "Processing: ${SENZING_SQL_FILE}"
    psql ${SENZING_DATABASE_URL} --file ${SENZING_SQL_FILE}
fi

# If specified, process multiple SENZING_SQL_FILES.

if [ -n "${SENZING_SQL_FILES}" ]; then
    IFS=" "
    for SENZING_SQL_FILE in ${SENZING_SQL_FILES}; do
        echo "Processing: ${SENZING_SQL_FILE}"
        psql ${SENZING_DATABASE_URL} --file ${SENZING_SQL_FILE}
    done
fi

echo "Completed."
