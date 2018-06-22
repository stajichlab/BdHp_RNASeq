#!/bin/bash
#SBATCH --nodes 1 --ntasks 8 --mem 4G --time 2:00:00 --out logs/kallisto.%a.log

module load kallisto
CPU=1
if [ $SLURM_CPUS_ON_NODE ]; then
 CPU=$SLURM_CPUS_ON_NODE
fi

N=${SLURM_ARRAY_TASK_ID}
INDIR=input
OUTDIR=results/kallisto
SAMPLEFILE=samples.csv
TRANSCRIPTS=db/Hompol1.idx

mkdir -p $OUTDIR

if [ ! $N ]; then
 N=$1
fi

if [ ! $N ]; then
 echo "cannot run without a number provided either cmdline or --array in sbatch"
 exit
fi
IFS=,
tail -n +2 $SAMPLEFILE | sed -n ${N}p | while read SAMPLE SPECIES CONDITION REP
do
 OUTNAME=$CONDITION.r${REP}
 if [ ! -f $OUTDIR/$OUTNAME/abundance.h5 ]; then
  kallisto quant -i $TRANSCRIPTS -o $OUTDIR/$OUTNAME -t $CPU --bias --single-overhang \
   $INDIR/RNASeq_${SAMPLE}_pair1.fastq.gz $INDIR/RNASeq_${SAMPLE}_pair2.fastq.gz
 fi
done
