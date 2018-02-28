#Load modules
module load trimmomatic
module load fastqc

#Make the base
for filename in *_R1_001_val_1.fq.gz
do
# first, make the base by removing _val*.fq.gz
      base=$(basename $filename .fq.gz)
      echo $base

 # now, construct the R2 filename by replacing R1 with R2
      base2=${base/_R1/_R2}
      base2=${base2/val_1/val_2} #since this line uses base 2 inside the squigles its swapping val_1 for val_2 in the already swapped base name
      echo $base2

 # run trimmomatic
        trimmomatic PE ${base}.fq.gz ${base2}.fq.gz ${base}.qc.fq ${base}_s1_se ${base2}.qc.fq ${base2}_s2_se SLIDINGWINDOW:3:28


