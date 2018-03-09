# Mapping
WGS maping and variant calling pipeline

*Trimming*

There were two types of adapters present in the original data set (nextera and illumina).  In order to get proerply trimmed reads without adapter contamination I ran trim-galore with the nextera arguement and trimmomatic with the normal sliding window (3:28).  This produced reads with good fastqc metrics for mapping.

*Mapping*

Some of the horses had multiple lanes and others did not.  Therefore I have two different mapping scripts.  The multi lane mapping was run in a directory with links to all the trimmed fastq files for all horses with more than one lane of sequencin.  Likewise, the single lane mapping script was run in a direcory with all the trimmed fastq files for horses with only one lane of sequencing.

*Convert, Sort, Index, and Stats*

This step of the process was integrated into the mapping script.
