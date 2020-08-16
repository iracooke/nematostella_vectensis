
echo latest/annotation/GCF_000209225.1_ASM20922v1_protein.lengths.txt > data.list
echo latest/annotation/GCF_000209225.1_ASM20922v1_protein.blastp.outfmt6 >> data.list
echo latest/annotation/GCF_000209225.1_ASM20922v1_protein.blastx.outfmt6 >> data.list
echo latest/annotation/GCF_000209225.1_ASM20922v1_protein.signalp.out >> data.list
echo latest/annotation/pfam_tabular.txt >> data.list
echo latest/annotation/nemvec.tsv >> data.list
echo latest/annotation/uniprot.xlsx >> data.list
echo latest/annotation_table.tsv >> data.list

echo latest/annotation_table.tsv >> data.list

tar -zcvf nematostella_vectensis.tgz -T data.list

rm data.list