#PBS -l nodes=1:ppn=8,mem=4gb -N cuffnorm.Bd -j oe 

module load cufflinks/2.2.1

CPU=$PBS_NP
if [ ! $CPU ]; then
 CPU=2
fi
GENOME=index/batrachochytrium_dendrobatidis_1_supercontigs
GFF=batrachochytrium_dendrobatidis_1_transcripts.gtf

SAMPLE1=Bd_Sporangia_R1.cuffquant/abundances.cxb,Bd_Sporangia_R2.cuffquant/abundances.cxb,Bd_Sporangia_R3.cuffquant/abundances.cxb
SAMPLE2=Bd_Zoospore_R1.cuffquant/abundances.cxb,Bd_Zoospore_R2.cuffquant/abundances.cxb,Bd_Zoospore_R3.cuffquant/abundances.cxb
cuffnorm -p $CPU -u -o cuffnorm -L Sporangia,Zoospore $GFF $SAMPLE1 $SAMPLE2

