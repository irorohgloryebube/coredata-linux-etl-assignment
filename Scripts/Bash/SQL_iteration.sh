#!/bin/bash
CSV_DIR="./data"   # Path that holds the csv files


########  Bash script that iterates over and copies each CSV files into posey database
# .....................................................................................
# PostgresSQL connectio detailsn
DB_NAME="posey"
DB_USER="ebube"

#Directory containing the csv files
CSV_FILES=$CSV_DIR

# Loop through each  of the files in the directory
for file in "$CSV_FILES"/*.csv; do

        # Extract the filename to use as table name
        table_name=$(basename "$file" .csv)

    # adjust table name if CSV file is "sales_reps.csv"
   if [[ "$table_name" == "sales_reps" ]]; then
    table_name="sales_rep"
   fi

   # Import the CSV file into the matching PostgreSQL table  
   psql -U "$DB_USER" -d "$DB_NAME" -c "\copy $table_name FROM '$file' WITH CSV HEADER"
                echo "Imported $file into table $table_name..."
done


