#PBS -l nodes=1:ppn=1,mem=1gb,walltime=1:00:00 -j oe -N prep

BASE=Bd
WORKDIR=work
mkdir -p $WORKDIR/reads
BARCODES=Metadata/barcodes.txt
FLOWCELLBASE=/bigdata/genomics/shared/309
LANEINFO=flowcell309_lane1
while read barcode name;
do
 echo "$barcode --> $name"
 ln -s $FLOWCELLBASE/${LANEINFO}_pair1_$barcode.fastq.gz $WORKDIR/reads/$name.fastq.gz
done < $BARCODES


# prep genome folder
mkdir -p $WORKDIR/genome

module load gmap
gmap_build -s none -D $WORKDIR/genome -d ${BASE}_JEL423 ~/shared/projects/Chytrid/Bd/genome/batrachochytrium_dendrobatidis_1_supercontigs.fasta ~/shared/projects/Chytrid/Bd/genome/batrachochytrium_dendrobatidis_jel423_mitochondrial_assembly_1_1_supercontigs.fasta
