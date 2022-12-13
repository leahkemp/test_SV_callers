# 05 - Annotate vcf

Created: 2022/08/23 11:02:36
Last modified: 2022/12/14 10:19:06

- **Aim:** This document documents/describes annotating the vcf files
- **Prerequisite software:** [slurm](https://slurm.schedmd.com/overview.html) v20.11.6, [conda](https://docs.conda.io/en/latest/) v4.13.0, [mamba](https://mamba.readthedocs.io/en/latest/index.html) v0.24.0, [GNU coreutils](https://www.gnu.org/software/coreutils/) v8.22
- **OS:** ORAC (CentOS Linux) (ESR production network)

## Table of contents

- [05 - Annotate vcf](#05---annotate-vcf)
  - [Table of contents](#table-of-contents)
  - [Annotate vcf](#annotate-vcf)

## Annotate vcf

*Work in progress*

Run bash script to annotate the SV vcf with [vcf_annotation_pipeline](https://github.com/ESR-NZ/vcf_annotation_pipeline). See my script at [./scripts/05_annotate_vcf/01_vcf_annotation_pipeline.sh](https://github.com/leahkemp/test_SV_callers/blob/main/scripts/05_annotate_vcf/01_vcf_annotation_pipeline.sh)

```bash
sbatch ./scripts/05_annotate_vcf/01_vcf_annotation_pipeline.sh
```
