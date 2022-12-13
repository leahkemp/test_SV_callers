#!/bin/bash

#SBATCH --partition prod
#SBATCH --time=00:05:00
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 1
#SBATCH --mem 1G
#SBATCH --job-name="01_compare_vcf"
#SBATCH --output="./logs/04_compare_vcf/slurm-%j-%x.out"

# configure file path to project directory
project_dir="/NGS/scratch/KSCBIOM/HumanGenomics/test_SV_callers"

# remove any old outputs of this script to avoid results being written twice to a directory
rm -rf $project_dir/results/04_compare_vcf/scout/
rm -rf $project_dir/results/04_compare_vcf/head_vcf/

# make directories to be used if it doesn't yet exist
mkdir -p $project_dir/results/04_compare_vcf/{scout,head_vcf,num_variants}

# get scout
echo ""
echo "Getting scout"
echo ""

singularity run \
-B $project_dir \
docker://bitnami/git:2.37.2-debian-11-r3 \
git clone https://github.com/Clinical-Genomics/scout.git $project_dir/results/04_compare_vcf/scout/

cd $project_dir/results/04_compare_vcf/scout/

singularity run \
-B $project_dir \
docker://bitnami/git:2.37.2-debian-11-r3 \
git checkout tags/v4.57.4

cd $project_dir

# get head of demo SV vcf files and my SV vcf files
echo ""
echo "Getting head of demo SV vcf files and my SV vcf files"
echo ""

zgrep -v "##" $project_dir/results/04_compare_vcf/scout/scout/demo/643594.clinical.SV.vcf.gz | head > $project_dir/results/04_compare_vcf/head_vcf/scout_demo_clinical_sv.txt

zgrep -v "##" $project_dir/results/04_compare_vcf/scout/scout/demo/643594.research.SV.vcf.gz | head > $project_dir/results/04_compare_vcf/head_vcf/scout_demo_research_sv.txt

zgrep -v "##" $project_dir/results/03_test_manta/cpu_manta/MantaWorkflow/results/variants/candidateSV.vcf.gz | head > $project_dir/results/04_compare_vcf/head_vcf/cpu_candidate_sv.txt

zgrep -v "##" $project_dir/results/03_test_manta/cpu_manta/MantaWorkflow/results/variants/candidateSmallIndels.vcf.gz | head > $project_dir/results/04_compare_vcf/head_vcf/cpu_candidate_small_indels.txt

zgrep -v "##" $project_dir/results/03_test_manta/cpu_manta/MantaWorkflow/results/variants/diploidSV.vcf.gz | head > $project_dir/results/04_compare_vcf/head_vcf/cpu_diploid_sv.txt

zgrep -v "##" $project_dir/results/03_test_manta/gpu_manta/4458.manta_work/results/variants/candidateSV.vcf.gz | head > $project_dir/results/04_compare_vcf/head_vcf/gpu_candidate_sv.txt

zgrep -v "##" $project_dir/results/03_test_manta/gpu_manta/4458.manta_work/results/variants/candidateSmallIndels.vcf.gz | head > $project_dir/results/04_compare_vcf/head_vcf/gpu_candidate_small_indels.txt

zgrep -v "##" $project_dir/results/03_test_manta/gpu_manta/4458.manta_work/results/variants/diploidSV.vcf.gz | head > $project_dir/results/04_compare_vcf/head_vcf/gpu_diploid_sv.txt

# get the number variants in demo SV vcf files and my SV vcf files
echo ""
echo "Getting the number variants in demo SV vcf files and my SV vcf files"
echo ""

zgrep -v "#" $project_dir/results/04_compare_vcf/scout/scout/demo/643594.clinical.SV.vcf.gz | wc -l > $project_dir/results/04_compare_vcf/num_variants/scout_demo_clinical_sv.txt

zgrep -v "#" $project_dir/results/04_compare_vcf/scout/scout/demo/643594.research.SV.vcf.gz | wc -l > $project_dir/results/04_compare_vcf/num_variants/scout_demo_research_sv.txt

zgrep -v "#" $project_dir/results/03_test_manta/cpu_manta/MantaWorkflow/results/variants/candidateSV.vcf.gz | wc -l > $project_dir/results/04_compare_vcf/num_variants/cpu_candidate_sv.txt

zgrep -v "#" $project_dir/results/03_test_manta/cpu_manta/MantaWorkflow/results/variants/candidateSmallIndels.vcf.gz | wc -l > $project_dir/results/04_compare_vcf/num_variants/cpu_candidate_small_indels.txt

zgrep -v "#" $project_dir/results/03_test_manta/cpu_manta/MantaWorkflow/results/variants/diploidSV.vcf.gz | wc -l > $project_dir/results/04_compare_vcf/num_variants/cpu_diploid_sv.txt

zgrep -v "#" $project_dir/results/03_test_manta/gpu_manta/4458.manta_work/results/variants/candidateSV.vcf.gz | wc -l > $project_dir/results/04_compare_vcf/num_variants/gpu_candidate_sv.txt

zgrep -v "#" $project_dir/results/03_test_manta/gpu_manta/4458.manta_work/results/variants/candidateSmallIndels.vcf.gz | wc -l > $project_dir/results/04_compare_vcf/num_variants/gpu_candidate_small_indels.txt

zgrep -v "#" $project_dir/results/03_test_manta/gpu_manta/4458.manta_work/results/variants/diploidSV.vcf.gz | wc -l > $project_dir/results/04_compare_vcf/num_variants/gpu_diploid_sv.txt

# clean up
echo ""
echo "Cleaning up"
echo ""

rm -rf $project_dir/results/04_compare_vcf/scout/
