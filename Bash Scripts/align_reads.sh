#!/usr/bin/env bash
#Align trimmed RNA reads to reference genome using HISAT2 tool
for file in *.fastq; do
    filename=$(basename "$file" .fastq)
    hisat2 -q --rna-strandness R -x grcm38/genome -U $file | samtools sort -o "$filename"_sorted.bam
done
