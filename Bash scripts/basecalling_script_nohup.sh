#!/bin/bash

#  -------------------------------------------------------------------------------
#  \author Lucas Munnes 
#  -------------------------------------------------------------------------------

echo "Name of sample: $1";
echo "Tissue of sample: $2";
echo "path/to/seqdata: $3";
echo "GPU: $4"  


read -p "Are you sure? (y/n)" -n 1 -r
echo    
if [[ $REPLY =~ ^[Yy]$ ]]
then
	
	datestamp=$(date +%F | tr -d -)
    	nohup_out=/mnt/data/lucas/Bachelor_thesis/Basecalling/logs/nohup-$datestamp-$1.out
	NAME=$1
	TISSUE=$2
	#directory of Guppy basecaller:
	GUPPY=/mnt/bin/guppy/guppy_6.1.1
	#working directory:
	WD=/mnt/data/lucas/Bachelor_thesis/Basecalling
	#SEQDATA:
	SEQDATA=$3
	#Basecalling config:
	CONF=dna_r9.4.1_450bps_sup.cfg 
	#command:

	nohup ${GUPPY}/bin/guppy_basecaller --disable_pings -c ${GUPPY}/data/${CONF} --trim_strategy dna --compress_fastq -r -x "cuda:$4" \
	-s ${WD}/${TISSUE}/${NAME} \
	-i ${SEQDATA} > $nohup_out &
	
else
	echo "Rerun script"
fi
