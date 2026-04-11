#!/bin/bash

base_dir="/Users/sofia.stamouli/Documents/taxprofiler-createtaxdb-paper/clinical_metagenomics/ncbi_genomes/ncbi_dataset/data"
input="samplesheet.csv"
output="samplesheet_kraken2.csv"

echo "id,taxid,fasta_dna" > "$output"

tail -n +2 "$input" | while IFS=, read -r id taxid
do
    folder="$base_dir/$id"

    if [ -d "$folder" ]; then
        fna_file=$(find "$folder" -maxdepth 1 -type f -name "*.fna" | head -n 1)

        if [ -n "$fna_file" ]; then
            echo "$id,$taxid,$fna_file" >> "$output"
        else
            echo "$id,$taxid,NA" >> "$output"
        fi
    else
        echo "$id,$taxid,NA" >> "$output"
    fi
done
