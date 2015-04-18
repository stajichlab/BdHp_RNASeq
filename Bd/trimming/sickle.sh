module load sickle
raw=/shared/stajichlab/projects/Chytrid/Hp_JEL142/RNAseq/raw
sickle pe -f $raw/RNASeq_Bd_Sporangia_R1_pair1.fastq.gz -r $raw/RNASeq_Bd_Sporangia_R1_pair2.fastq.gz -t sanger \
 -o  RNASeq_Bd_Sporangia_R1_pair1.trimmed.fastq -p RNASeq_Bd_Sporangia_R1_pair2.trimmed.fastq \
 -s RNASeq_Bd_Sporania_R1_trimmed_single.fastq -q 15 -l 20
gzip RNASeq_Bd_Sporangia_R1_pair1.trimmed.fastq
gzip RNASeq_Bd_Sporangia_R1_pair2.trimmed.fastq
gzip RNASeq_Bd_Sporangia_R1_trimmed_single.fastq
