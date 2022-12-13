#!/bin/bash

#SBATCH --partition prod
#SBATCH --time=04:00:00
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 16
#SBATCH --mem 4G
#SBATCH --job-name="01_cpu_manta"
#SBATCH --output="./logs/03_test_manta/slurm-%j-%x.out"

# configure file path to project directory
project_dir="/NGS/scratch/KSCBIOM/HumanGenomics/test_SV_callers"

# configure file path to bam directory
bam_dir="/NGS/scratch/KSCBIOM/HumanGenomics/test_SV_callers/data"

# remove any old outputs of this script to avoid results being written twice to a directory
rm -rf $project_dir/results/03_test_manta/cpu_manta/

# make directories to be used if it doesn't yet exist
mkdir -p $project_dir/results/03_test_manta/cpu_manta/

# set the shell to be used by conda for this script (and re-start shell to implement changes)
echo ""
echo "Configuring conda"
echo ""

conda init bash
source ~/.bashrc

# create conda environment with manta installed and activate it
echo ""
echo "Creating conda environment with manta installed"
echo ""

mamba env create --force -f $project_dir/scripts/envs/conda.manta.1.6.0.yml
conda activate manta

# setup manta workflow
echo ""
echo "Setting up manta workflow"
echo ""

cd $project_dir/results/03_test_manta/cpu_manta/

configManta.py \
--referenceFasta=$project_dir/results/02_setup/reference_genome/human_g1k_v37_decoy.fasta \
--normalBam $bam_dir/4458_recalibrated.bam

# run manta workflow
echo ""
echo "Running manta workflow"
echo ""

# run manta workflow
$project_dir/results/03_test_manta/cpu_manta/MantaWorkflow/runWorkflow.py -j 16

cd $project_dir
