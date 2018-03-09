#load modules
module load bwa
module load samtools


#Step 1 - Map
echo "mapping NAD101"
bwa mem -a -t 4 -M -R @RG"\t"ID:$base"\t"SM:$base"\t"PL:illumina"\t"LB:$base /finno/data/equCab3.0_NCBI/ref_assembly/genome_3.0.fna <(cat NAD101_CAGAGAGG-AAGGAGTA_L00*_R1_001_val_1.qc.fq) <(cat NAD101_CAGAGAGG-AAGGAGTA_L00*_R2_001_val_2.qc.fq) > NAD101.sam

echo "mapping NAD197"
bwa mem -a -t 4 -M -R @RG"\t"ID:$base"\t"SM:$base"\t"PL:illumina"\t"LB:$base /finno/data/equCab3.0_NCBI/ref_assembly/genome_3.0.fna <(cat NAD_197_ACTTGA_L00*_R1_001_val_1.qc.fq) <(cat NAD_197_ACTTGA_L00*_R2_001_val_2.qc.fq) > NAD197.sam

echo "mapping NAD205"
bwa mem -a -t 4 -M -R @RG"\t"ID:$base"\t"SM:$base"\t"PL:illumina"\t"LB:$base /finno/data/equCab3.0_NCBI/ref_assembly/genome_3.0.fna <(cat NAD_205_CAGATC_L00*_R1_001_val_1.qc.fq) <(cat NAD_205_CAGATC_L00*_R2_001_val_2.qc.fq) > NAD205.sam

echo "CHECK THE FOR LOOP FOR SAM "

echo "mapping NAD49"
bwa mem -a -t 4 -M -R @RG"\t"ID:$base"\t"SM:$base"\t"PL:illumina"\t"LB:$base /finno/data/equCab3.0_NCBI/ref_assembly/genome_3.0.fna <(cat NAD_205_CAGATC_L00*_R1_001_val_1.qc.fq) <(cat NAD_205_CAGATC_L00*_R2_001_val_2.qc.fq) > NAD205.sam
echo "mapping done!"


#Step 2A - Make the base
for filename in *.sam
do
      base=$(basename $filename .sam)
echo $base
	#I checked this loop after 3 of the 4 horses had a .sam file made and the bases were called correctly.


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
