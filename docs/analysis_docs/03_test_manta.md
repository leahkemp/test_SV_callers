# 03 - Test manta

Created: 2022/08/19 15:01:42
Last modified: 2022/12/14 10:18:16

- **Aim:** This document documents/describes testing manta
- **Prerequisite software:** [slurm](https://slurm.schedmd.com/overview.html) v20.11.6, [conda](https://docs.conda.io/en/latest/) v4.13.0, [mamba](https://mamba.readthedocs.io/en/latest/index.html) v0.24.0, [GNU coreutils](https://www.gnu.org/software/coreutils/) v8.22, [parabricks](https://docs.nvidia.com/clara/parabricks/3.8.0/index.html) v3.8
- **Prerequisite hardware:** Tesla V100-PCIE-32GB
- **OS:** ORAC (CentOS Linux) (ESR production network)

## Table of contents

- [03 - Test manta](#03---test-manta)
  - [Table of contents](#table-of-contents)
  - [CPU manta](#cpu-manta)
  - [GPU manta](#gpu-manta)
  - [List target output files for writing pipeline](#list-target-output-files-for-writing-pipeline)

## CPU manta

Run bash script to run the [*cpu version* of manta](https://github.com/Illumina/manta). See my script at [./scripts/03_test_manta/01_cpu_manta.sh](https://github.com/leahkemp/test_SV_callers/blob/main/scripts/03_test_manta/01_cpu_manta.sh) and my conda env at [./scripts/envs/conda.manta.1.6.0.yml](https://github.com/leahkemp/test_SV_callers/blob/main/scripts/envs/conda.manta.1.6.0.yml)

```bash
sbatch ./scripts/03_test_manta/01_cpu_manta.sh
```

## GPU manta

Run bash script to run the [*gpu version* of manta](https://docs.nvidia.com/clara/parabricks/3.8.0/Documentation/ToolDocs/man_manta.html). See my script at [./scripts/03_test_manta/02_gpu_manta.sh](https://github.com/leahkemp/test_SV_callers/blob/main/scripts/03_test_manta/02_gpu_manta.sh)

```bash
sbatch ./scripts/03_test_manta/02_gpu_manta.sh
```

## List target output files for writing pipeline

Helps to know the file names the software outputs when wrapping the software in snakemake

```bash
ls -lhv ./results/03_test_manta/cpu_manta/MantaWorkflow/results/variants/
```

<details><summary markdown="span">My output (click to expand)</summary>

```bash
total 15M
-rw-rw---- 1 lkemp SEC_lab_KSCBIOM 4.7M Aug 19 17:24 candidateSV.vcf.gz
-rw-rw---- 1 lkemp SEC_lab_KSCBIOM 596K Aug 19 17:24 candidateSV.vcf.gz.tbi
-rw-rw---- 1 lkemp SEC_lab_KSCBIOM 3.3M Aug 19 17:24 candidateSmallIndels.vcf.gz
-rw-rw---- 1 lkemp SEC_lab_KSCBIOM 676K Aug 19 17:24 candidateSmallIndels.vcf.gz.tbi
-rw-rw---- 1 lkemp SEC_lab_KSCBIOM 1.1M Aug 19 17:24 diploidSV.vcf.gz
-rw-rw---- 1 lkemp SEC_lab_KSCBIOM 113K Aug 19 17:24 diploidSV.vcf.gz.tbi
```

</details>
<br/>

```bash
ls -lhv ./results/03_test_manta/cpu_manta/MantaWorkflow/results/variants/
```

<details><summary markdown="span">My output (click to expand)</summary>

```bash
total 15M
-rw-rw-r-- 1 lkemp SEC_lab_KSCBIOM 4.7M Aug 19 17:40 candidateSV.vcf.gz
-rw-rw-r-- 1 lkemp SEC_lab_KSCBIOM 596K Aug 19 17:40 candidateSV.vcf.gz.tbi
-rw-rw-r-- 1 lkemp SEC_lab_KSCBIOM 3.3M Aug 19 17:40 candidateSmallIndels.vcf.gz
-rw-rw-r-- 1 lkemp SEC_lab_KSCBIOM 675K Aug 19 17:40 candidateSmallIndels.vcf.gz.tbi
-rw-rw-r-- 1 lkemp SEC_lab_KSCBIOM 1.1M Aug 19 17:40 diploidSV.vcf.gz
-rw-rw-r-- 1 lkemp SEC_lab_KSCBIOM 113K Aug 19 17:40 diploidSV.vcf.gz.tbi
```

</details>
<br/>
