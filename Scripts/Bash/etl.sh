#!/bin/bash


#PERFORMING ETL PROCESS

#------------------------------
# STEP 1: EXTRACTING CSV FILE
#------------------------------

# A.Using environment varable
url="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-finan>
# B.Create a  folder callded raw
mkdir -p ./raw/

# C.Create directory called raw, download file and save it to raw folder
cd ./raw/
curl -sS -L -O "$url"

ls -la                # show details of the folder
echo "CSV file extracted and stored  in raw folder"


#-----------------------------
#STEP 2: TRANSFORMING THE FILE
#-----------------------------

# A. Renaming the column
filename=$(basename "$url")
sed -i '1s/Variable_code/variable_code/' "$filename"

# B. Creating folder, selecting columns and storing them in the folder
mkdir -p ../Transformed
/home/ebube/.local/bin/csvcut  -c  Year,Value,Units,variable_code annual-enterprise-survey-2023-financial->head -n 5 ../Transformed/2023_year_finance.csv

echo "Transformation stage completed"




#------------------------------
#STEP 3:  LOAD TRANSFORMED DATA
#-------------------------------

mkdir -p ../Gold          # Creating a directory called Gold
mv  ../Transformed/2023_year_finance.csv  ../Gold         # Moving the transformed file to Gold directory
ls -la ../Gold
head -n 5 ../Gold/2023_year_finance.csv

echo "Loading completed"
