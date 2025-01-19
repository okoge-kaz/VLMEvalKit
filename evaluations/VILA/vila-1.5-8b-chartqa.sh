#!/bin/sh
#$ -cwd
#$ -l node_q=1
#$ -l h_rt=1:00:00
#$ -o outputs/vila/7b/chart-qa/$JOB_ID.log
#$ -e outputs/vila/7b/chart-qa/$JOB_ID.log
#$ -p -3

# priority: -5: normal, -4: high, -3: highest

# Load modules
module use /gs/fs/tga-NII-LLM/modules/modulefiles

module load ylab/cuda/12.4
module load ylab/cudnn/9.1.0
module load ylab/nccl/cuda-12.4/2.21.5
module load ylab/hpcx/2.17.1
module load ninja/1.11.1

source .venv/bin/activate

export TMPDIR="/gs/bs/tge-gc24sp03/cache"
export TMP="/gs/bs/tge-gc24sp03/cache"
export HF_CACHE="/gs/bs/tge-gc24sp03/cache"
export HF_HOME="/gs/bs/tge-gc24sp03/cache"

python run.py \
  --data ChartQA_TEST \
  --model Llama-3-VILA1.5-8b \
  --verbose
