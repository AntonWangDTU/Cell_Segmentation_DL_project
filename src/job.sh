#!/bin/sh 
### General options 
### -- specify queue -- 
#BSUB -q hpc
### -- set the job Name -- 
#BSUB -J My_Application
### -- ask for number of cores (default: 1) -- 
#BSUB -n 4 
### -- specify that the cores must be on the same host -- 
#BSUB -R "span[hosts=1]"
### -- specify that we need 4GB of memory per core/slot -- 
#BSUB -R "rusage[mem=4GB]"
### -- specify that we want the job to get killed if it exceeds 5 GB per core/slot -- 
#BSUB -M 5GB
### -- set walltime limit: hh:mm -- 
#BSUB -W 24:00 
### -- set the email address -- 
# please uncomment the following line and put in your e-mail address,
# if you want to receive e-mail notifications on a non-default address
##BSUB -u s183220@dtu.dk
### -- send notification at start -- 
#BSUB -B 
### -- send notification at completion -- 
#BSUB -N 
### -- Specify the output and error file. %J is the job-id -- 
### -- -o and -e mean append, -oo and -eo mean overwrite -- 
#BSUB -o Output_%J.out 
#BSUB -e Output_%J.err 

source /dtu/blackhole/17/136247/miniconda3/etc/profile.d/conda.sh
conda activate cellpose

# retraining script
python3 /dtu/blackhole/17/136247/Cell_Segmentation_DL_project/src/retraining.py \
    > /dtu/blackhole/17/136247/Cell_Segmentation_DL_project/src/output_retraining.out

# fine-tuning script
python3 /dtu/blackhole/17/136247/Cell_Segmentation_DL_project/src/fine_tuning.py \
    > /dtu/blackhole/17/136247/Cell_Segmentation_DL_project/src/fine_tuning.out
