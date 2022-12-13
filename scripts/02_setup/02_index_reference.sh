#!/bin/bash

#SBATCH --partition prod
#SBATCH --time=00:05:00
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 1
#SBATCH --mem 1G
#SBATCH --job-name="02_index_reference"
#SBATCH --output="./logs/02_setup/slurm-%j-%x.out"

# configure file path to project directory
project_dir="/NGS/scratch/KSCBIOM/HumanGenomics/test_SV_callers"

# remove any old outputs of this script to avoid results being written twice to a directory
rm -rf $project_dir/results/02_setup/reference_genome/human_g1k_v37_decoy.fasta.fai

# make directory to be used if it doesn't yet exist
mkdir -p $project_dir/results/02_setup/reference_genome/

# set the shell to be used by conda for this script (and re-start shell to implement changes)
echo ""
echo "Configuring conda"
echo ""

conda init bash
source ~/.bashrc

# create conda environment with samtools installed and activate it
echo ""
echo "Creating conda environment with samtools installed"
echo ""

mamba env create --force -f $project_dir/scripts/envs/conda.samtools.1.15.1.yml
conda activate samtools

# index reference genome
echo ""
echo "Indexing reference genome"
echo ""

samtools faidx $project_dir/results/02_setup/reference_genome/human_g1k_v37_decoy.fasta
