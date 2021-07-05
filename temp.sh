#!/bin/bash
#SBATCH --account=def-jfaubert
#SBATCH --nodes=1
#SBATCH --gres=gpu:v100:1
#SBATCH --ntasks-per-node=4
#SBATCH --mem=32000M
#SBATCH --time=10:00:00
#SBATCH --job-name=OH_RA
#SBATCH --wait

# salloc --time=02:0:0 --ntasks=2 --nodes=1 --mem-per-cpu 32G --gres=gpu:v100:1 --account=def-jfaubert

source ~/pytorch_wilds/bin/activate

# python3 -m domainbed.scripts.download \
#         --data_dir=/home/mjavad/scratch/domainbed/data

cp -r /home/mjavad/scratch/domainbed/data $SLURM_TMPDIR/

python3 -m domainbed.scripts.train\
       --data_dir=$SLURM_TMPDIR/data/ \
       --algorithm ERM\
       --dataset OfficeHome\
       --test_env 0
