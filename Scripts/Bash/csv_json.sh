  GNU nano 7.2                                    csv_json.sh                                              #!/bin/bash

#STEP : DOWNLOAD THE JSON AND CSV FILES
url1="https://samples-files.com/samples/code/json/sample2.json"
url2="https://samples-files.com/samples/code/json/sample1.json"
url3="https://drive.google.com/uc?id=1zO8ekHWx9U7mrbx_0Hoxxu6od7uxJqWw&export=download.csv"

# CREATE A DIRECTORY TO HOUSE THE DOWNLOADED FILES
mkdir -p ./downloads   # make folder if not exist
cd ./downloads || exit # go into it, stop script if it fails

# OPEN THE DIRECTORY AND DOWNLOAD FILE
curl -sS -L -O "$url1"
#----------
curl -sS -L -O "$url2"
#---------
curl -sS -L -O "$url3"
echo " Downloaded files here:"
ls

#MOVE THE FILES FROM FOLDER TO ANOTHER
cd ../
mkdir -p json_and_csv #creating the recipient folder
mv ./downloads/* ./json_and_csv #move the files to json_and_csv

echo " Files moved successfully into ./json_and_csv"
ls -la ./json_and_csv

