#$ -N featurecounts
#$ -pe smp 1
#$ -l h_vmem=20G
#$ -o /mnt/data/lucas/Bachelor_thesis/featurecounts/logs/featurecounts.$JOB_ID.out
#$ -j y
#$ -cwd

## From here business as usual

datestamp=$(date +%F | tr -d -)
INPUT=$1

source /home/lucas/tools/miniconda3/etc/profile.d/conda.sh

conda activate 

featureCounts  -L -s 0 -T ${NSLOTS} -g transcript_id -a /mnt/data/lucas/reference_genome/Ribes_nigrum.gtf \
-o /mnt/data/lucas/Bachelor_thesis/featurecounts/${INPUT}_${datestamp}_featureCounts.txt  /mnt/data/lucas/Bachelor_thesis/Minimap2/Ribes_nigrum_${INPUT}*.bam
