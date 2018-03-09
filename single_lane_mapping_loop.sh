#load modules
module load bwa
module load samtools

#Make the base
for filename in *_R1_001_val_1.qc.fq
do
# first, make the base by removing _val*.qc.fq
      base=$(basename $filename .qc.fq)
echo $base

# now, construct the R2 base filename by replacing R1 with R2
      base2=${base/_R1/_R2}
      base2=${base2/val_1/val_2} #since this line uses base 2 it is swapping val_1 for val_2 in the already swapped based name
echo $base2


#Step 1 - Map
echo "Mapping...good luck!"
bwa mem -a -t 4 -M -R @RG"\t"ID:$base"\t"SM:$base"\t"PL:illumina"\t"LB:$base /finno/data/equCab3.0_NCBI/ref_assembly/genome_3.0.fna ${base}.qc.fq ${base2}.qc.fq > ${base}.sam
echo "Mapping Done!"


#Step 2 - Convert to bam
echo "converting to bam & sorting magic"
samtools view -bS ${base}.sam | samtools sort > ${base}_sorted.bam
#Options in use
        #b: output BAM File
        #S: Auto dected input format
        #|: Pipe the output to samtools sort
#from samtools sort output a bam that denotes it is sorted
echo "all files sorted"


#Setp3 - Indexing
echo "BAM like Emrill Legassi! To make an index"
samtools index ${base}_sorted.bam
echo "all indexing done"


#Step 4 - Output Mapping Stats
echo "Calculate Mapping Stats"
samtools flagstat ${base}_sorted.bam > ${base}_mapping_stats.txt


done

