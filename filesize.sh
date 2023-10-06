#!/bin/bash -l
# this script should run a command to see how big the file threatened-species.csv.gz is and how big threatened-species.csv is

ziped=$(du -h threatened-species.csv.gz | cut -f1)

echo "Zipped file size: $ziped
"

gunzip -k -f threatened-species.csv.gz

unziped=$(du -h threatened-species.csv | cut -f1)

echo "Unzipped file size: $unziped
"

wordcount=$(wc -l threatened-species.csv)

echo "Lines in unziped file: 
$wordcount
"

echo "what I get when I do gzip -l threatened-species.csv.gz:
"

gzip -l threatened-species.csv.gz

COMPRESSED=$(du threatened-species.csv.gz | cut -f1)
UNCOMPRESSED=$(du threatened-species.csv | cut -f1)

echo "
what I get when I do Jason's python script
"

python -c "print($COMPRESSED / $UNCOMPRESSED)"

echo "
bye! :)"

