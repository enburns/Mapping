#Load modules
module load trim_galore
module load cutadapt
module load fastqc

#Made dir
mkdir trim_galore

#Make the base
for filename in *_R1_001.fastq.gz
do
 #first, make the base by removing .fq.gz
      base=$(basename $filename .fastq.gz)
      echo $base

 #now, construct the second base (R2) filename by replacing 1 with 2
      base2=${base/_R1/_R2}
      echo $base2

 # run trim_galore and then fastqc the trimmed output  
        trim_galore --paired --nextera --fastqc ${base}.fastq.gz ${base2}.fastq.gz --output trim_galore
	#note the output is to the directory made in line 7.  
 
done

