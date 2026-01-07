#!/usr/bin/env bash

# Checking the quality of the reads using fastqc 
# Will perform on all fastq files in the current directory

for file in *.fastq; do
fastqc $file
done