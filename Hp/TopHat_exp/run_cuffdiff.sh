#PBS -l nodes=1:ppn=4 -N cuffdiff -j oe 
#PBS -l mem=4g -q batch

module load cufflinks/2.2.1

CPU=$PBS_NP
GENOME=index/HpJEL142
GFF=HpJEL142.MAKER_v3.genes.gff
SAMPLE1=Hp_Sporangia_R1.tophat_out/accepted_hits.bam,Hp_Sporangia_R2.tophat_out/accepted_hits.bam,Hp_Sporangia_R3.tophat_out/accepted_hits.bam
SAMPLE2=Hp_Zoospore_R1.tophat_out/accepted_hits.bam,Hp_Zoospore_R2.tophat_out/accepted_hits.bam,Hp_Zoospore_R3.tophat_out/accepted_hits.bam

cuffdiff -o cufffdiff -p $CPU -b $GENOME.fa -u $GFF $SAMPLE1 $SAMPLE2

echo "work done"
