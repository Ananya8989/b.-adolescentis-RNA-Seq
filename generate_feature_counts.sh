#!/usr/bin/env bash

# Building a featureCounts matrix from aligned RNA reads
for file in *_sorted.bam; do
    filename=$(basename "$file" _sorted.bam)
    featureCounts -S 1 -a Mus_musculus.GRCm39.106.gtf -o ${filename}_feature_counts.txt $file
done