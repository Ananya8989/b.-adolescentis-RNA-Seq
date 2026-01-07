#!/usr/bin/env bash

# This script prefetches the SRA files you need and converts to fastq formart
read -p "Enter the number of SRA files to fetch: " num_files

for x in $(seq 1 $num_files); do
read -p "Enter SRA file to fetch: " sra
prefetch $sra
cd $sra
read -p "Is the file paired-end? (y/n): " paired
if [ "$paired" == "y" ]; then
  fasterq-dump --split-files $sra
  mv ${sra}_1.fastq ..
  mv ${sra}_2.fastq ..
else
  fasterq-dump $sra
  mv ${sra}.fastq ..
fi
cd ..
done


