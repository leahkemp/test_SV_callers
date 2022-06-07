#!/bin/bash

#SBATCH --job-name=manta_run
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=leahmhkemp@gmail.com
#SBATCH --partition=gpu
#SBATCH --mem=40gb
#SBATCH --mincpus=4
#SBATCH --time=8:00:00

pbrun manta \
--ref /NGS/scratch/KSCBIOM/HumanGenomics/publicData/gatk_resource_bundle/b37/human_g1k_v37_decoy.fasta \
--in-normal-bam /NGS/scratch/KSCBIOM/HumanGenomics/test_SV_callers/bams/4458_recalibrated.bam \
--out-prefix /NGS/scratch/KSCBIOM/HumanGenomics/test_SV_callers/parabricks_manta/4458 \
--num-threads 8 \
--tmp-dir /NGS/scratch/KSCBIOM/HumanGenomics/tmp/
