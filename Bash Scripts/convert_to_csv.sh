#!/usr/bin/env bash

# turns the txt files into csv files that we can manipulate and analyze

count=0
for file in *.txt; do
    filename=$(basename "$file" .txt)
    if [ $count -eq 0 ]; then
        awk '{print $1}' "$file" > output.csv
    fi
    awk '{print $NF}' "$file" | paste -d, output.csv -> temp_column.csv
    mv temp_column.csv output.csv
    count=$((count + 1))
done
