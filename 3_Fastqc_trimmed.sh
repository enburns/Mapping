#Load modules
module load fastqc

#Make the base
for filename in *_R1_001_val_1.qc.fq
do
# first, make the base by removing _val*.qc.fq
      base=$(basename $filename .qc.fq)
      echo $base

 # now, construct the R2 filename by replacing R1 with R2
      base2=${base/_R1/_R2}
      base2=${base2/val_1/val_2} #since this line uses base 2 it is swapping val_1 for val_2 in the already swapped based name
      echo $base2

 # run fastqc
        fastqc $base.qc.fq
        fastqc $base2.qc.fq

done

