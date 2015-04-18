
#PBS -l nodes=1:ppn=8,mem=4gb -N cuffquant.Bd -j oe 

module load cufflinks/2.2.1

CPU=$PBS_NP
if [ ! $CPU ]; then
 CPU=2
fi

N=$PBS_ARRAYID
if [ ! $N ]; then
 N=$1
fi


GENOME=index/batrachochytrium_dendrobatidis_1_supercontigs
GFF=batrachochytrium_dendrobatidis_1_transcripts.gtf

FILE=`ls Bd_*.tophat_out/accepted_hits.bam | head -n $N | tail -n 1`
OUTDIR=`dirname $FILE`
OUTDIR=`basename $OUTDIR .tophat_out` 
echo $OUTDIR.cuffquant
cuffquant -o $OUTDIR.cuffquant -p $CPU -u $GFF $FILE
 
echo "work done"
