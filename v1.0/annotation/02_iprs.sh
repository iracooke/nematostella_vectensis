module load java/jdk1.8.0_162 
module load bioawk
source activate py2

split_fasta(){
	input=$1
	species_in=$2
	cat $input | bioawk -c 'fastx' -v species_in=$2 '{ if( (NR-1)%1000==0 ){file=sprintf("%s%d.fa",species_in,(NR-1));} printf(">%s\t%s\n%s\n",$name,$comment,$seq) >> file}'
}


f=GCF_000209225.1_ASM20922v1_protein.faa
name=nemvec
split_fasta $f $name

for seqs in *.fa;do
	cat $seqs | sed 's/*$//' > ${seqs}.tmp
	mv ${seqs}.tmp $seqs
	if [ ! -f ${seqs}.tsv ];then
		echo "Running $seqs"
		/fast/sci-irc/interpro_scan/interproscan-5.20-59.0/interproscan.sh -i $seqs --disable-precalc --goterms --pathways --tempdir /fast/tmp/ > ${seqs%.fa}.log
	fi
done
cat *.fa.tsv > ${name}.tsv
cat *.fa.gff3 > ${name}.gff3
