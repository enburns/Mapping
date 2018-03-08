module load bwa

#Map using BWA MEM using each input seperately since there are some samples with multiple lanes and others don't have multiple lanes

echo "mapping L101"
        bwa mem -a -t 4 -M genome_3.0.fna L101_R1_001*.qc.fq L101_R2_001*.qc.fq > L101.sam
echo "mapping NAD101 multiple lanes"
        bwa mem -a -t 4 -M genome_3.0.fna <(cat NAD101_*R1*.qc.fq) <(cat NAD101_*R2*.qc.fq) > NAD101.sam
echo "mapping NAD157"
        bwa mem -a -t 4 -M genome_3.0.fna NAD157_R1_001*.qc.fq NAD157_R2_001*.qc.fq > NAD157.sam
echo "mapping NAD197 multiple lanes"
        bwa mem -a -t 4 -M genome_3.0.fna <(cat NAD_197_*R1*.qc.fq) <(cat NAD_197_*R2*.qc.fq) > NAD197.sam
echo "mapping NAD205 Multiple lanes"
        bwa mem -a -t 4 -M genome_3.0.fna <(cat NAD_205_*R1*.qc.fq) <(cat NAD_205_*R2*.qc.fq) > NAD205.sam
echo "mapping NAD49 multiple lanes"
        bwa mem -a -t 4 -M genome_3.0.fna <(cat NAD49*R1*.qc.fq) <(cat NAD49*R2*.qc.fq) > NAD49.sam
echo "mapping NAD 211"
        bwa mem -a -t 4 -M genome_3.0.fna NAD211_R1*.qc.fq NAD211_R2*.qc.fq > NAD211.sam
echo "mapping NAD 216"
        bwa mem -a -t 4 -M genome_3.0.fna NAD216_R1*.qc.fq NAD216_R2*.qc.fq > NAD216.sam
echo "mapping NAD 217"
        bwa mem -a -t 4 -M genome_3.0.fna NAD217_R1*.qc.fq NAD217_R2*.qc.fq > NAD217.sam
echo "mapping NAD 220"
        bwa mem -a -t 4 -M genome_3.0.fna NAD220_R1*.qc.fq NAD220_R2*.qc.fq > NAD220.sam
echo "mapping NAD 56"
        bwa mem -a -t 4 -M genome_3.0.fna NAD56_R1*.qc.fq NAD56_R2*.qc.fq > NAD56.sam
echo "mapping NAD 228 only 2 more left"
        bwa mem -a -t 4 -M genome_3.0.fna NAD228_R1*.qc.fq NAD228_R2*.qc.fq > NAD228.sam
echo "mapping NAD 238 only 1 more left"
        bwa mem -a -t 4 -M genome_3.0.fna NAD238_R1*.qc.fq NAD238_R2*.qc.fq > NAD238.sam
echo "mapping NAD 264 LAST ONE"
        bwa mem -a -t 4 -M genome_3.0.fna NAD264_R1*.qc.fq NAD264_R2*.qc.fq > NAD264.sam
echo "mapping done"

