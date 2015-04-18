#PBS -l nodes=1:ppn=4 -N tophat -j oe 
#PBS -l mem=4g -q batch

module load tophat

GENOME=index/batrachochytrium_dendrobatidis_1_supercontigs
GFF=batrachochytrium_dendrobatidis_1_transcripts.gtf


CPU=$PBS_NP

if [ ! $CPU ]; then 
 CPU=2
fi

N=$PBS_ARRAYID

if [ ! $N ]; then
 N=$1
fi

if [ ! $N ]; then
 echo "Need a number either with qsub -t N or run_tophat N"
 exit
fi
DIR=/shared/stajichlab/projects/Chytrid/Bd/RNASeq/trimmed
FILE=`ls /shared/stajichlab/projects/Chytrid/Bd/RNASeq/trimmed | grep R._pair1\.trimmed\.fastq | head -n $N | tail -n 1`
R1=$DIR/$FILE
R2=`echo $R1 | perl -p -e 's/pair1/pair2/'`

FC_PREFIX=flowcell309_lane1 # to make this unique
ID=`echo $FILE | perl -p -e 's/\.trimmed\.fastq$//; s/RNASeq_//;'`
SAMPLE=`echo $ID | perl -p -e 's/\_pair\d+//;'`
ID=$ID.$FC_PREFIX

echo "tophat  --b2-very-sensitive -G $GFF -p $CPU --rg-id $ID --rg-sample $SAMPLE --rg-center UCR --rg-platform ILLUMINA -o $SAMPLE.tophat_out $GENOME $R1 $R2"

tophat  --b2-very-sensitive -G $GFF -p $CPU --rg-id $ID --rg-sample $SAMPLE --rg-center UCR \
 --rg-platform ILLUMINA -o $SAMPLE.tophat_out $GENOME $R1 $R2

echo "Done"
