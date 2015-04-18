#PBS -l nodes=1:ppn=8,mem=30g -q highmem -N TrinGG_h -j oe  

module load trinity-rnaseq
module load gmap
module load samtools

CPU=$PBS_NP
MAX_INTRON_LENGTH=1000
echo "CPU is $CPU"
Trinity --CPU $CPU --genome_guided_bam Bdrnaseq_alignments.csorted.bam --max_memory 28G --genome_guided_max_intron $MAX_INTRON_LENGTH --output highmem_trinity_out_dir

echo "Done"

