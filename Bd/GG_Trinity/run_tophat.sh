#PBS -l nodes=1:ppn=8 -N tophat -j oe
#PBS -l mem=10g

module load tophat

GENOME=index/batrachochytrium_dendrobatidis_1_supercontigs
GFF=batrachochytrium_dendrobatidis_1_transcripts.gtf


SPREADS1=RNASeq_Bd_Sporangia_R1_pair1.trimmed.fastq,RNASeq_Bd_Sporangia_R2_pair1.trimmed.fastq,RNASeq_Bd_Sporangia_R3_pair1.trimmed.fastq
SPREADS2=RNASeq_Bd_Sporangia_R1_pair2.trimmed.fastq,RNASeq_Bd_Sporangia_R2_pair2.trimmed.fastq,RNASeq_Bd_Sporangia_R3_pair2.trimmed.fastq
ZREADS1=RNASeq_Bd_Zoospore_R1_pair1.trimmed.fastq,RNASeq_Bd_Zoospore_R2_pair1.trimmed.fastq,RNASeq_Bd_Zoospore_R3_pair1.trimmed.fastq
ZREADS2=RNASeq_Bd_Zoospore_R1_pair2.trimmed.fastq,RNASeq_Bd_Zoospore_R2_pair2.trimmed.fastq,RNASeq_Bd_Zoospore_R3_pair2.trimmed.fastq

echo "tophat  --b2-very-sensitive -G $GFF -p $PBS_NP $GENOME $SPREADS1,$ZREADS1 $SPREADS2,$ZREADS2"

tophat --no-coverage-search --b2-very-sensitive -G $GFF -p $PBS_NP $GENOME $SPREADS1,$ZREADS1 $SPREADS2,$ZREADS2

echo "Done"
