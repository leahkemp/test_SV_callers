#!/bin/bash

#SBATCH --partition gpu
#SBATCH --time=04:00:00
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 16
#SBATCH --mem 4G
#SBATCH --job-name="02_gpu_manta"
#SBATCH --output="./logs/03_test_manta/slurm-%j-%x.out"

# configure file path to project directory
project_dir="/NGS/scratch/KSCBIOM/HumanGenomics/test_SV_callers"

# configure file path to bam directory
bam_dir="/NGS/scratch/KSCBIOM/HumanGenomics/test_SV_callers/data"

# configure file path to temporary directory
tmp_dir="/NGS/scratch/KSCBIOM/HumanGenomics/test_SV_callers/tmp"

# configure file path to parabricks
parabricks_dir="/opt/parabricks/3.8/parabricks"

# remove any old outputs of this script to avoid results being written twice to a directory
rm -rf $project_dir/results/03_test_manta/gpu_manta/

# make directories to be used if it doesn't yet exist
mkdir -p $project_dir/results/03_test_manta/gpu_manta/4458/
mkdir -p $tmp_dir

# run manta
echo ""
echo "Running manta"
echo ""

$parabricks_dir/pbrun manta \
--ref $project_dir/results/02_setup/reference_genome/human_g1k_v37_decoy.fasta \
--in-normal-bam $bam_dir/4458_recalibrated.bam \
--out-prefix $project_dir/results/03_test_manta/gpu_manta/4458 \
--num-threads 16 \
--tmp-dir $tmp_dir
