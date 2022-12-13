# 02 - Setup

Created: 2022/08/19 15:18:47
Last modified: 2022/12/14 10:18:09

- **Aim:** This document documents/describes setting up for this project
- **Prerequisite software:** [slurm](https://slurm.schedmd.com/overview.html) v20.11.6, [singularity](https://docs.sylabs.io/guides/3.1/user-guide/index.html) v3.7.2-1.el7, [conda](https://docs.conda.io/en/latest/) v4.13.0, [mamba](https://mamba.readthedocs.io/en/latest/index.html) v0.24.0, [GNU coreutils](https://www.gnu.org/software/coreutils/) v8.22
- **OS:** ORAC (CentOS Linux) (ESR production network)

## Table of contents

- [02 - Setup](#02---setup)
  - [Table of contents](#table-of-contents)
  - [Get reference genome](#get-reference-genome)
  - [Index reference genome](#index-reference-genome)

## Get reference genome

Run bash script to get the reference human genome. See my script at [./scripts/02_setup/01_get_reference.sh](https://github.com/leahkemp/test_SV_callers/blob/main/scripts/02_setup/01_get_reference.sh) and my conda env at [./scripts/envs/conda.gsutil.5.11.yml](https://github.com/leahkemp/test_SV_callers/blob/main/scripts/envs/conda.gsutil.5.11.yml)

```bash
sbatch ./scripts/02_setup/01_get_reference.sh
```

## Index reference genome

Run bash script to index the reference human genome. See my script at [./scripts/02_setup/02_index_reference.sh](https://github.com/leahkemp/test_SV_callers/blob/main/scripts/02_setup/02_index_reference.sh) and my conda env at [./scripts/envs/conda.samtools.1.15.1.yml](https://github.com/leahkemp/test_SV_callers/blob/main/scripts/envs/conda.samtools.1.15.1.yml)

```bash
sbatch ./scripts/02_setup/02_index_reference.sh
```
