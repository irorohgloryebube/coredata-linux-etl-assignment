Posey Project – SQL & Bash ETL Scripts
 Project Overview

This project demonstrates the use of SQL scripts and Bash scripts to solve real-world data problems in PostgreSQL and to implement an ETL (Extract, Transform, Load) pipeline.

The work is structured into two main parts:

SQL scripts answering business-related questions.

Bash scripts automating data ingestion, transformation, scheduling, and file management.

All scripts are organized under the Scripts/ directory
Project Structure
project/
├── Scripts/
│   ├── SQL/
│   │   ├── q1.sql
│   │   ├── q2.sql
│   │   ├── q3.sql
│   │   └── q4.sql
│   └── Bash/
│       ├── etl.sh
│       ├── schedule.sh
│       ├── csv_json.sh
│       └── SQL_iteration.sh
├── diagram.txt
└── README.md


SQL/ contains all queries with comments.

Bash/ contains all automation and ETL scripts.


 SQL Solutions
Question 1

Find order IDs where either gloss_qty or poster_qty is greater than 4000.
 q1.sql

SELECT id
FROM orders
WHERE gloss_qty > 4000
   OR poster_qty > 4000;

Question 2

Find order IDs where standard_qty is zero and either gloss_qty or poster_qty is greater than 1000.
 q2.sql

SELECT id
FROM orders
WHERE standard_qty = 0
  AND (gloss_qty > 1000 OR poster_qty > 1000);

Question 3

Find account names starting with C or W, with primary_poc containing “ana” cas inensitive.
 q3.sql

SELECT name
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%')
  AND primary_poc ILIKE '%ana%';

Question 4

Show the region name, sales rep name, and account name, sorted alphabetically by account.
 q4.sql

SELECT
     r.name AS region_name,
     s.name AS sales_rep_name,
     a.name AS account_name
FROM region r
JOIN sales_rep s
     ON r.id = s.region_id
LEFT JOIN accounts a
     ON s.id = a.sales_rep_id
ORDER BY a.name ASC;

 Bash Scripts
1. etl.sh

Automates the ETL process:

Extract: Downloads raw CSV into .

Transform: Renamed Variable_code → variable_code, selects columns.

Load: Load Transformed data to a directory called Gold

2. schedule.sh

Schedules the ETL script to run daily at 12:00 AM using cron jobs.


3. json-csv.sh

Moves all CSV and JSON files from a source folder into a destination folder json_and_CSV/.

4. SQL_iteration.sh

Iterates over all CSV files in the data/ folder and imports them into PostgreSQL (posey database).



ETL Pipeline Architecture

Below is the  architecture of the ETL process:

          +------------------+
          |     Extract      |
          | (API / CSV )     |
          +------------------+
                   |
                   v
          +------------------+
          |    Transform     |
          | (Clean & Format) |
          +------------------+
                   |
                   v
          +------------------+
          |      Load        |
          |   (Gold folder)  |
          +------------------+

