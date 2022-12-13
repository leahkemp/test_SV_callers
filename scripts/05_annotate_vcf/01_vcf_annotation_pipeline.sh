#!/bin/bash

#SBATCH --partition prod
#SBATCH --time=00:05:00
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 1
#SBATCH --mem 1G
#SBATCH --job-name="01_vcf_annotation"
#SBATCH --output="./logs/05_annotate_vcf/slurm-%j-%x.out"

# configure file path to project directory
project_dir="/NGS/scratch/KSCBIOM/HumanGenomics/test_SV_callers"
