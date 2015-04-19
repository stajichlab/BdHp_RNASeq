#PBS -l nodes=1:ppn=8,mem=10g -q batch -N Hp.TrinGG  -j oe

module load trinity-rnaseq
module load gmap
module load samtools

CPU=$PBS_NP
MAX_INTRON_LENGTH=1000
echo "CPU is $CPU"
Trinity --CPU $CPU --genome_guided_bam Hprnaseq_alignments.sorted.bam --max_memory 10G --genome_guided_max_intron $MAX_INTRON_LENGTH
