#PBS -l nodes=1:ppn=4 -N tophat -j oe 
#PBS -l mem=4g -q batch

module load tophat

GENOME=index/HpJEL142
GFF=HpJEL142.MAKER_v3.genes.gff


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
DIR=/shared/stajichlab/projects/Chytrid/Hp_JEL142/RNAseq/trimmed/
FILE=`ls $DIR | grep R._pair1\.timmed\.fastq\.gz | head -n $N | tail -n 1`
R1=$DIR/$FILE
R2=`echo $R1 | perl -p -e 's/pair1/pair2/'`

FC_PREFIX=FC309_lane1 # to make this unique
ID=`echo $FILE | perl -p -e 's/_pair1\.timmed\.fastq\.gz$//; s/RNASeq_//;'`
SAMPLE=`echo $ID | perl -p -e 's/\_pair\d+//;'`
ID=$ID.$FC_PREFIX

echo "tophat  --b2-very-sensitive -G $GFF -p $CPU --rg-id $ID --rg-sample $SAMPLE --rg-center UCR --rg-platform ILLUMINA -o $SAMPLE.tophat_out $GENOME $R1 $R2"

tophat  --b2-very-sensitive -G $GFF -p $CPU --rg-id $ID --rg-sample $SAMPLE --rg-center UCR \
 --rg-platform ILLUMINA -o $SAMPLE.tophat_out $GENOME $R1 $R2

echo "Done"
