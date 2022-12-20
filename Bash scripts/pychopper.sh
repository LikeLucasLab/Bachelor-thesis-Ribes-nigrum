#$ -N pychopper
#$ -pe smp 8
#$ -l h_vmem=3G
#$ -e /mnt/data/lucas/Bachelor_thesis/Pychopper/logs/pychop.$JOB_ID.stderr
#$ -o /mnt/data/lucas/Bachelor_thesis/Pychopper/logs/pychop.$JOB_ID.stdout
#$ -cwd

## From here business as usual

datestamp=$(date +%F | tr -d -)
INPUT=$1
log=/mnt/data/lucas/Bachelor_thesis/Pychopper/logs

source /home/lucas/tools/miniconda3/etc/profile.d/conda.sh

conda activate 

pychopper -t ${NSLOTS} -k PCS111 -r ${log}/$datestamp-$INPUT_report.pdf /mnt/data/lucas/Bachelor_thesis/Basecalling/fastq/${INPUT}.fastq  
/mnt/data/lucas/Bachelor_thesis/Pychopper/trimmed_${INPUT}.fastq
