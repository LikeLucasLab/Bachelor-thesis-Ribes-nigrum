#$ -N zcat
#$ -pe smp 20
#$ -l h_vmem=30G
#$ -o /mnt/data/lucas/logs/merge.$JOB_ID.stdout
#$ -j y
#$ -cwd


#!/bin/bash

#  -------------------------------------------------------------------------------
#  \author Lucas Munnes 
#  \zcat fast.gz files
#  -------------------------------------------------------------------------------

zcat  /mnt/data/lucas/Bachelor_thesis/Basecalling/Ribes_nigrum_$1_P$2.fastq.gz > /mnt/data/lucas/Bachelor_thesis/Basecalling/fastq/Ribes_nigrum_$1_P$2.fastq
