#PBS -l nodes=1:ppn=4,mem=5g
module load samtools/1.1

samtools sort -m 4G tophat_out/accepted_hits.bam Bdrnaseq_alignments.csorted
