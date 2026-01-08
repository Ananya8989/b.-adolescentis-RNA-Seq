#!/usr/bin/env bash

# Remove low-quality RNA reads using the trimmomatic tool
# performs trimming on all .fastq files in the current directory
# works only for single-end files

for file in *.fastq; do
    filename=$(basename "$file" .fastq)
    java -jar trimmomatic-0.39.jar SE -threads 32 "$file" "$filename"_trimmed.fastq TRAILING:10 -phred33
done