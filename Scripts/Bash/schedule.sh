
# This  schedule the script to run everyday at 12:00 AM and stores the  result in  pipeline-log


0 0 * * * /home/ebube/survey.sh >> /home/ebube/pipeline-log 2>&1
