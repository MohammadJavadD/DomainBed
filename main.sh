#!/bin/bash
# source activate pytorch
source ~/pytorch_wilds/bin/activate
#
#rm -rf sweep

# creat commands
python -m domainbed.scripts.sweep launch\
       --data_dir=dummy \
       --output_dir=sweep\
       --command_launcher computecanada\
       --skip_confirmation \
       --algorithms ERM\
       --datasets OfficeHome\
       --n_hparams 20\
       --n_trials 3

#sbatch single_job_cc.sh
# python -m domainbed.scripts.sweep delete_incomplete\
#        --data_dir=dummy \
#        --output_dir=./sweep\
#        --command_launcher computecanada\

# python -m domainbed.scripts.collect_results\
#        --input_dir=./sweep18 
#/home/mj/Desktop/D3A/DG_DA/DomainBed/DomainBed/domainbed/misc/test_sweep_data/

# python -m domainbed.scripts.download \
# --data_dir=/home/mjavad/scratch/rundata/

#scp -r  ./Domainbed jfaubert@cedar.computecanada.ca:/home/jfaubert/scratch/

# python -m domainbed.scripts.train\
#        --data_dir=/home/mjavad/scratch/rundata/ \
#        --algorithm ERM\
#        --dataset PACS
