# Testing parabricks manta

Created: 2022/06/07 10:19:15
Last modified: 2022/06/07 16:50:34

- **Aim:** Testing [manta](https://github.com/Illumina/manta) as a structural variant (SV) caller
- **Prerequisite software:** [conda v4.11.0](https://docs.conda.io/en/latest/), [mamba v0.19.1](https://mamba.readthedocs.io/en/latest/installation.html)
- **OS:** ORAC (CentOS Linux 7 (Core))

- [Testing parabricks manta](#testing-parabricks-manta)
  - [Setup](#setup)
  - [Run manta](#run-manta)

## Setup

Get manta

```bash
mamba create -n manta manta=1.6.0
conda activate manta
```

Create runscript

```bash
cd /NGS/scratch/KSCBIOM/HumanGenomics/test_SV_callers/manta/
touch run_manta.sh
```

<details><summary markdown="span">My runscript (click to expand)</summary>

```bash
#!/bin/bash

#SBATCH --job-name=manta_run
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=leahmhkemp@gmail.com
#SBATCH --partition=prod
#SBATCH --cores=4
#SBATCH --mem=4gb
#SBATCH --time=4:00:00

# setup workflow
configManta.py \
--referenceFasta=/NGS/scratch/KSCBIOM/HumanGenomics/publicData/gatk_resource_bundle/b37/human_g1k_v37_decoy.fasta \
--normalBam /NGS/scratch/KSCBIOM/HumanGenomics/test_SV_callers/bams/4458_recalibrated.bam

# run workflow
/NGS/scratch/KSCBIOM/HumanGenomics/test_SV_callers/manta/MantaWorkflow/runWorkflow.py -j 8
```

</details>
<br/>

## Run manta

Run manta

```bash
cd /NGS/scratch/KSCBIOM/HumanGenomics/test_SV_callers/manta/
sbatch run_manta.sh
```
