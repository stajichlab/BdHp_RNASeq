module load sickle
raw=/shared/stajichlab/projects/Chytrid/Hp_JEL142/RNAseq/raw
#prefix=RNASeq_Bd_Sporangia_R1
#prefix=RNASeq_Bd_Sporangia_R2
#prefix=RNASeq_Bd_Sporangia_R3
#prefix=RNASeq_Bd_Zoospore_R1
#prefix=RNASeq_Bd_Zoospore_R2
#prefix=RNASeq_Bd_Zoospore_R3
#prefix=RNASeq_Hp_Sporangia_R1
#prefix=RNASeq_Hp_Sporangia_R2
#prefix=RNASeq_Hp_Sporangia_R3
#prefix=RNASeq_Hp_Zoospore_R1
#prefix=RNASeq_Hp_Zoospore_R2
prefix=RNASeq_Hp_Zoospore_R3
sickle pe -f $raw/$prefix\_pair1.fastq.gz -r $raw/$prefix\_pair2.fastq.gz -t sanger \
 -o  $prefix\_pair1.trimmed.fastq -p $prefix\_pair2.trimmed.fastq \
 -s $prefix\_trimmed_single.fastq -q 15 -l 20
gzip $prefix\_pair1.trimmed.fastq
gzip $prefix\_pair2.trimmed.fastq
gzip $prefix\_trimmed_single.fastq
