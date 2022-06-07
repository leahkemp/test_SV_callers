# Testing parabricks manta

Created: 2022/06/07 10:19:15
Last modified: 2022/06/07 11:14:49

- **Aim:** Testing [parabricks manta](https://docs.nvidia.com/clara/parabricks/v3.6.1/text/variant_callers.html#manta) as a structural variant (SV) caller
- **Prerequisite software:** [parabricks v3.6.1](https://docs.nvidia.com/clara/parabricks/v3.6.1/)
- **OS:** ORAC (CentOS Linux 7 (Core))

- [Testing parabricks manta](#testing-parabricks-manta)
  - [Setup](#setup)
  - [Run manta](#run-manta)

## Setup

Double check the version of parabricks I'm using

```bash
pbrun --version
```

My output:

```bash
Please visit https://docs.nvidia.com/clara/#parabricks for detailed documentation

pbrun: 3.6.1-1
```

Create runscript

```bash
cd /NGS/scratch/KSCBIOM/HumanGenomics/test_SV_callers/parabricks_manta/
touch run_manta.sh
```

<details><summary markdown="span">My runscript (click to expand)</summary>

```bash
#!/bin/bash

#SBATCH --job-name=manta_run
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=leahmhkemp@gmail.com
#SBATCH --partition=gpu
#SBATCH --mem=40gb
#SBATCH --mincpus=4
#SBATCH --time=8:00:00

pbrun manta \
--ref /NGS/scratch/KSCBIOM/HumanGenomics/publicData/gatk_resource_bundle/b37/human_g1k_v37_decoy.fasta \
--in-normal-bam /NGS/scratch/KSCBIOM/HumanGenomics/test_SV_callers/bams/4458_recalibrated.bam \
--out-prefix /NGS/scratch/KSCBIOM/HumanGenomics/test_SV_callers/parabricks_manta/4458 \
--num-threads 8 \
--tmp-dir /NGS/scratch/KSCBIOM/HumanGenomics/tmp/
```

</details>
<br/>

## Run manta

Create screen to run in

```bash
screen -S manta_run
```

Run manta

```bash
cd /NGS/scratch/KSCBIOM/HumanGenomics/test_SV_callers/parabricks_manta/
sbatch run_manta.sh
```
