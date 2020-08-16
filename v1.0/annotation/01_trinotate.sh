#!/bin/bash

module load blast/2.7.1+ 
module load tmhmm/2.0c
module load hmmer/3.2.1
module load signalp/4.1

prot_file=$1
cds_file=$2
trinotate_dbs=/fast/shared/trinotate_dbs

prot_basename=${prot_file%.faa}

# Scan for pfam domains on genome predicted proteins
function run_hmmscan {
	hmmscan --cpu 32 --domtblout ${1}.pfam.out ${trinotate_dbs}/Pfam-A.hmm	\
	 ${1}.faa > pfam.log
}

function run_signalp {
	signalp -f short -n ${1}.signalp.out ${1}.faa	
}

function run_tmhmm {
	tmhmm --short < ${1}.faa > ${1}.tmhmm.out	
}

function run_blastp_sp {
	blastp -query ${1}.faa -db ${trinotate_dbs}/uniprot_sprot.pep -num_threads 32 -max_target_seqs 1 -outfmt 6 > ${1}.blastp.outfmt6
}

function run_blastx_sp {
	blastx -query ${2} -db ${trinotate_dbs}/uniprot_sprot.pep -num_threads 32 -max_target_seqs 1 -outfmt 6 > ${1}.blastx.outfmt6
}

run_blastp_sp $prot_basename
run_blastx_sp $prot_basename ${cds_file}
run_hmmscan $prot_basename
run_signalp $prot_basename
run_tmhmm $prot_basename

#The pfam outputs need a little extra processing to make a tabular file

cat ${prot_basename}.pfam.out | awk '!/^#/{printf("%s\t%s\t%s\t",$4,$2,$7);for(i=23;i<=NF;i++){printf("%s ",$i)}printf("\n")}' > pfam_tabular.txt
```