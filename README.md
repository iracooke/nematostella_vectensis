# Nematostella vectensis

This repository includes scripts for functional gene annotation on the Nematostella genome.

The latest genome is [v1.0 from NCBI](https://www.ncbi.nlm.nih.gov/genome/?term=txid45351[orgn])

Annotations are available as the file `annotation_table.tsv` after downloading the data package (see below)

### Functional annotations

Command line analyses are summarised in [latest/README.md](v1.0/README.md)

R code to merge results and produce a final file is in [01_annotate](01_annotate.md)

### Running code and accessing results

If you would simply like to run the R code and/or download final results proceed as follows;

1. Checkout this repository 
2. Download additional data not hosted on github due to size constraints
```bash
wget 'https://cloudstor.aarnet.edu.au/plus/s/5MA4k6ATGH23CQE/download' -O data.tgz
tar -zxvf data.tgz 
```
3. You should now be able to compile the Markdown files

## Genome Versions

- [v1.0](https://www.ncbi.nlm.nih.gov/assembly/GCF_000209225.1/) 





