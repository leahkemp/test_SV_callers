# 04 - Compare vcf

Created: 2022/08/19 15:01:42
Last modified: 2022/12/14 11:01:47

- **Aim:** This document documents/describes comparing the vcf files
- **Prerequisite software:** [slurm](https://slurm.schedmd.com/overview.html) v20.11.6, [conda](https://docs.conda.io/en/latest/) v4.13.0, [mamba](https://mamba.readthedocs.io/en/latest/index.html) v0.24.0, [GNU coreutils](https://www.gnu.org/software/coreutils/) v8.22
- **OS:** ORAC (CentOS Linux) (ESR production network)

## Table of contents

- [04 - Compare vcf](#04---compare-vcf)
  - [Table of contents](#table-of-contents)
  - [Compare demo SV's provides by scout with my SV vcf files](#compare-demo-svs-provides-by-scout-with-my-sv-vcf-files)
  - [Thinking](#thinking)
  - [Talking with scout developers](#talking-with-scout-developers)

## Compare demo SV's provides by scout with my SV vcf files

Run bash script to compare the demo SV vcf provided by scout with my SV vcf files. See my script at [./scripts/04_compare_vcf/01_compare_vcf.sh](https://github.com/leahkemp/test_SV_callers/blob/main/scripts/04_compare_vcf/01_compare_vcf.sh)

```bash
sbatch ./scripts/04_compare_vcf/01_compare_vcf.sh
```

## Thinking

The demo SV vcf provided by scout looks to be:

- A jointly called vcf of a cohort
- Annotated

My SV vcf looks to be:

- The variants in both "candidateSmallIndels.vcf" and "candidateSV.vcf" don't look to have be filtered (it doesn't a "FILTER" column)
- The "diploidSV.vcf" file is smaller than the "candidateSmallIndels.vcf" and "candidateSV.vcf" files
- All variants in "diploidSV.vcf" are marked as "PASS" in the "FILTER" column, so it looks to contain only passed variants

See the description of the [manta output vcf files](https://github.com/Illumina/manta/blob/master/docs/userGuide/README.md#outputs), this also seems to support using the "diploidSV.vcf" file for our use case

The plan:

- I'll try joint calling a cohort with manta too for the situation where we analyse cohorts as well
- I'll try annotate the SV vcfs
- I'll ustilise the "diploidSV.vcf" files given they look to be filtered

## Talking with scout developers

See the conversations with the scout developers: https://github.com/Clinical-Genomics/scout/discussions/3643
