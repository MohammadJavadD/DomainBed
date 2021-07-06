#!/bin/bash
#SBATCH --array=0-240
#SBATCH --account=def-jfaubert
#SBATCH --nodes=1
#SBATCH --gres=gpu:1
#SBATCH --ntasks-per-node=4
#SBATCH --mem=32000M
#SBATCH --time=10:00:00
#SBATCH --job-name=OH_RA
#SBATCH --wait

# Copy data
# cp -r /home/mjavad/scratch/rundata/ $SLURM_TMPDIR/
cp -r /home/mjavad/scratch/domainbed/data/ $SLURM_TMPDIR/

# source activate pytorch
source ~/pytorch_wilds/bin/activate

# replace dummy file location with $SLURM_TMPDIR
#sed -i "s/dummy/$SLURM_TMPDIR/g" commands.txt 

#SLURM_ARRAY_TASK_ID=11
command=`cat commands.txt | sed "${SLURM_ARRAY_TASK_ID}!d"`
dir=$SLURM_TMPDIR/data/
command="${command/dummy/$dir}"

echo ${SLURM_ARRAY_TASK_ID}
echo $command
eval $command
