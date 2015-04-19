
#PBS -l nodes=1:ppn=8,mem=4gb -N cuffquant -j oe 

module load cufflinks/2.2.1

CPU=$PBS_NP

if [ ! $CPU ]; then
 CPU=2
fi

N=$PBS_ARRAYID

if [ ! $N ]; then
 N=$1
fi

#if [ ! $N ]; then
# echo "Need a number either with qsub -t N or run_cufflinks N"
# exit
#fi

GENOME=index/HpJEL142
GFF=HpJEL142.MAKER_v3.genes.gff
SAMPLE1=Hp_Sporangia_R1.tophat_out/accepted_hits.bam,Hp_Sporangia_R2.tophat_out/accepted_hits.bam,Hp_Sporangia_R3.tophat_out/accepted_hits.bam
SAMPLE2=Hp_Zoospore_R1.tophat_out/accepted_hits.bam,Hp_Zoospore_R2.tophat_out/accepted_hits.bam,Hp_Zoospore_R3.tophat_out/accepted_hits.bam
cuffquant -o cuffquant -p $CPU -u $GFF $SAMPLE1 $SAMPLE2
