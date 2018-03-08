module load samtools

#make the base name
for filename in *.sam
do 
	base=$(basename $filename .sam)
echo $base

#Step 1 - Convert to bam
echo "converting to bam & sorting magic"
samtools view -bS ${base}.sam | samtools sort > ${base}_sorted.bam
#Options in use
	#b: output BAM File
	#S: Auto dected input format
	#|: Pipe the output to samtools sort
	#from samtools sort output a bam that denotes it is sorted

#Setp2 - index
echo "indexing...hope its faster"
samtools index ${base}_sorted.bam

#run flagstats
echo "Calculate Mapping Stats"
samtools flagstat ${base}_sorted.bam > ${base}_mapping_stats.txt

done
