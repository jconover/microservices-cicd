#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE auth_db;
    CREATE DATABASE user_db;
    CREATE DATABASE payment_db;
    CREATE DATABASE notification_db;
EOSQL
