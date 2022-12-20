#$ -N Minimap2_Ribes_nigrum
#$ -pe smp 40
#$ -l h_vmem=10G
#$ -e /mnt/data/lucas/Bachelor_thesis/Minimap2/logs/minimap2.$JOB_ID.stderr
#$ -o /mnt/data/lucas/Bachelor_thesis/Minimap2/logs/minimap2.$JOB_ID.stdout
#$ -cwd

genome=/mnt/data/lucas/reference_genome/Purge_pool_prak_barbara_all_1.2Gb_masked.fasta
INPUT=/mnt/data/lucas/Bachelor_thesis/Pychopper/$1_full_length_output.fastq
FILE=$1

Minimap=/mnt/bin/minimap2/minimap2-2.22_x64-linux

SAMTOOLS=/mnt/bin/samtools/samtools-1.13/samtools

##Mapping and converting sam to bam

${Minimap}/minimap2 -ax splice -t ${NSLOTS} ${genome} ${INPUT} | ${SAMTOOLS} view -@ ${NSLOTS} -Sb | ${SAMTOOLS} sort -@ ${NSLOTS} > /mnt/data/lucas/Bachelor_thesis/Minimap2/${FILE}.bam


