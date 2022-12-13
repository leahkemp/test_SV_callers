#!/bin/bash

#SBATCH --partition prod
#SBATCH --time=00:30:00
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 1
#SBATCH --mem 1G
#SBATCH --job-name="01_get_reference"
#SBATCH --output="./logs/02_setup/slurm-%j-%x.out"

# configure file path to project directory
project_dir="/NGS/scratch/KSCBIOM/HumanGenomics/test_SV_callers"

# remove any old outputs of this script to avoid results being written twice to a directory
rm -rf $project_dir/results/02_setup/reference_genome/

# make directory to be used if it doesn't yet exist
mkdir -p $project_dir/results/02_setup/reference_genome/

# set the shell to be used by conda for this script (and re-start shell to implement changes)
echo ""
echo "Configuring conda"
echo ""

conda init bash
source ~/.bashrc

# create conda environment with gsutil installed and activate it
echo ""
echo "Creating conda environment with gsutil installed"
echo ""

mamba env create --force -f $project_dir/scripts/envs/conda.gsutil.5.11.yml
conda activate gsutil

# get reference genome
echo ""
echo "Getting reference genome"
echo ""

gsutil \
cp -r gs://gatk-legacy-bundles/b37/human_g1k_v37_decoy.fasta \
$project_dir/results/02_setup/reference_genome/

gsutil \
cp -r gs://gatk-legacy-bundles/b37/human_g1k_v37_decoy.dict \
$project_dir/results/02_setup/reference_genome/

gsutil \
cp -r gs://gatk-legacy-bundles/b37/human_g1k_v37_decoy.fasta.amb \
$project_dir/results/02_setup/reference_genome/

gsutil \
cp -r gs://gatk-legacy-bundles/b37/human_g1k_v37_decoy.fasta.ann \
$project_dir/results/02_setup/reference_genome/

gsutil \
cp -r gs://gatk-legacy-bundles/b37/human_g1k_v37_decoy.fasta.bwt \
$project_dir/results/02_setup/reference_genome/

gsutil \
cp -r gs://gatk-legacy-bundles/b37/human_g1k_v37_decoy.fasta.flat \
$project_dir/results/02_setup/reference_genome/

gsutil \
cp -r gs://gatk-legacy-bundles/b37/human_g1k_v37_decoy.fasta.pac \
$project_dir/results/02_setup/reference_genome/

gsutil \
cp -r gs://gatk-legacy-bundles/b37/human_g1k_v37_decoy.fasta.sa \
$project_dir/results/02_setup/reference_genome/
