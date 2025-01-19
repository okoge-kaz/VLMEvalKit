#!/bin/sh
#$ -cwd
#$ -l node_q=1
#$ -l h_rt=1:00:00
#$ -p -5

# priority: -5: normal, -4: high, -3: highest

# Load modules
module use /gs/fs/tga-NII-LLM/modules/modulefiles

module load ylab/cuda/12.4
module load ylab/cudnn/9.1.0
module load ylab/nccl/cuda-12.4/2.21.5
module load ylab/hpcx/2.17.1
module load ninja/1.11.1

# reference: https://github.com/open-compass/VLMEvalKit/blob/main/docs/en/Quickstart.md

# Set environment variables
source .venv/bin/activate

pip install --upgrade pip

# VILA install
cd ../VILA
git checkout vila1.5
pip install -e .

# VLMEvalKit
cd VLMEvalKit
pip install -e .

pip install pillow
pip install transformers==4.36.2
pip install numpy==1.26.4

pip install flash-attn==2.5.2 --no-build-isolation --no-cache-dir

pip install torch==2.2.0 torchvision==0.17.0
