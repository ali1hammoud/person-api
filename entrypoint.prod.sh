#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    # Run the Python script to check database connection
    while ! python check_db_connection.py; do
        echo "Waiting for postgres to be ready..."
        sleep 5
    done
    echo "PostgreSQL started"
fi

exec "$@"