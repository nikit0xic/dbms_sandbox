#!/bin/bash

PGHOST=127.0.0.1
PGPORT=5432
PGUSER=trainee
PGPASSWORD=postgres
PGDATABASE=trainer

CSV_DIR=/home/resources
TABLES_ORDER=("users" "customers" "products" "orders" "product_orders")


if [ -z "$PGHOST" ] || [ -z "$PGPORT" ] || [ -z "$PGUSER" ] || [ -z "$PGPASSWORD" ] || [ -z "$PGDATABASE" ]; then
    echo "Error: Missing PostgreSQL connection information"
    exit 1
fi

for TABLE_NAME in "${TABLES_ORDER[@]}"; do
  CSV_FILE="$CSV_DIR/$TABLE_NAME.csv"
  if [ ! -f "$CSV_FILE" ]; then
    echo "Error: No CSV file found for table $TABLE_NAME"
    exit 1
  fi
  echo "Importing data from $CSV_FILE..."
  PGPASSWORD="$PGPASSWORD" psql -h "$PGHOST" -p "$PGPORT" -U "$PGUSER" -d "$PGDATABASE" -c "TRUNCATE TABLE $TABLE_NAME;"
  PGPASSWORD="$PGPASSWORD" psql -h "$PGHOST" -p "$PGPORT" -U "$PGUSER" -d "$PGDATABASE" -c "COPY $TABLE_NAME FROM '$CSV_FILE' WITH (FORMAT CSV, HEADER true);"
  if [ $? -ne 0 ]; then
    echo "Error: Failed to import data from $CSV_FILE"
    exit 1
  fi
  echo "Data imported successfully from $CSV_FILE"
done

echo "All data imported successfully"
