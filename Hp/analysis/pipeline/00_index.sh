#!/bin/bash
#SBATCH -p short --nodes 1 --ntasks 1 --out logs/index-kallisto.log

module load kallisto
DB=Hompol1
FOLDER=db
FILE=Hompol1.transcripts.fasta
kallisto index -i $FOLDER/$DB.idx $FOLDER/$FILE
