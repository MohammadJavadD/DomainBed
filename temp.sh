
# python3 -m domainbed.scripts.download \
#        --data_dir=./domainbed/data

python3 -m domainbed.scripts.train\
       --data_dir=./domainbed/data/\
       --algorithm ERM\
       --dataset OfficeHome\
       --test_env 0