#PBS -l nodes=1:ppn=8 -N tophatiHp -j oe
#PBS -l mem=10g

module load tophat

GENOME=index/HpJEL142
GFF=HpJEL142.MAKER_v2.gff 


SPREADS1=RNASeq_Hp_Sporangia_R1_pair1.timmed.fastq.gz,RNASeq_Hp_Sporangia_R2_pair1.timmed.fastq.gz,RNASeq_Hp_Sporangia_R3_pair1.timmed.fastq.gz
SPREADS2=RNASeq_Hp_Sporangia_R1_pair2.timmed.fastq.gz,RNASeq_Hp_Sporangia_R2_pair2.timmed.fastq.gz,RNASeq_Hp_Sporangia_R3_pair2.timmed.fastq.gz
ZREADS1=RNASeq_Hp_Zoospore_R1_pair1.timmed.fastq.gz,RNASeq_Hp_Zoospore_R2_pair1.timmed.fastq.gz,RNASeq_Hp_Zoospore_R3_pair1.timmed.fastq.gz
ZREADS2=RNASeq_Hp_Zoospore_R1_pair2.timmed.fastq.gz,RNASeq_Hp_Zoospore_R2_pair2.timmed.fastq.gz,RNASeq_Hp_Zoospore_R3_pair2.timmed.fastq.gz

echo "tophat  --b2-very-sensitive -G $GFF -p $PBS_NP $GENOME $SPREADS1,$ZREADS1 $SPREADS2,$ZREADS2"

tophat --no-coverage-search --b2-very-sensitive -G $GFF -p $PBS_NP $GENOME $SPREADS1,$ZREADS1 $SPREADS2,$ZREADS2

echo "Done"

