#!/bin/bash

#SBATCH --job-name=manta_run
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=leahmhkemp@gmail.com
#SBATCH --partition=prod
#SBATCH --cores=4
#SBATCH --mem=4gb
#SBATCH --time=4:00:00

# setup workflow
configManta.py \
--referenceFasta=/NGS/scratch/KSCBIOM/HumanGenomics/publicData/gatk_resource_bundle/b37/human_g1k_v37_decoy.fasta \
--normalBam /NGS/scratch/KSCBIOM/HumanGenomics/test_SV_callers/bams/4458_recalibrated.bam

# run workflow
/NGS/scratch/KSCBIOM/HumanGenomics/test_SV_callers/manta/MantaWorkflow/runWorkflow.py -j 8
