
```bash
./01_trinotate.sh GCF_000209225.1_ASM20922v1_protein.faa GCF_000209225.1_ASM20922v1_rna.fna > annotate.log
```



**Lookup information from SwissProt**

After running the blastp and blastx analyses above we export all of the hits into a single text file 

```bash
cat GCF_000209225.1_ASM20922v1_protein.blast[px].outfmt6 | awk '{print $2}' | sort -u > blast_uniprot_ids.txt
```

This file can be uploaded to the [Uniprot mapping tool](https://www.uniprot.org/uploadlists/) to retrieve an excel formatted file with complete information about all of these proteins.

**Run Interproscan**

In addition to the analyses above we also run Interproscan using the script `02_iprs.sh`. This splits the protein fasta file into chunks and runs interproscan separately on each chunk. The combined results are available in a single `.tsv` file at the end.
