#!/bin/bash

base_dir="/Users/sofia.stamouli/Documents/taxprofiler-createtaxdb-paper/clinical_metagenomics/ncbi_genomes/ncbi_dataset/data"
log_file="missing_proteins.txt"

for folder in "$base_dir"/GCF_*
do
    id=$(basename "$folder")

    protein_file="$folder/protein.faa"
    new_name="$folder/${id}.faa"

    if [ -f "$protein_file" ]; then
        mv "$protein_file" "$new_name"
        echo "Renamed: $protein_file -> $new_name"
    else
        echo "$id" >> "$log_file"
    fi
done
