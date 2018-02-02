#!/bin/bash
#SBATCH --job-name=gatk
#SBATCH --partition=compute
#SBATCH --mem=30G
#SBATCH --cpus-per-task=1
#SBATCH --time=1-0:00:00
#SBATCH --ntasks=2
##SBATCH --mail-user=%u@oist.jp
##SBATCH --mail-type=BEGIN,FAIL,END
#SBATCH --input=none
#SBATCH --output=%j.out
##SBATCH --error=job_%j.err

. $HOME/.bashrc 

reference=/work/MikheyevU/Maeva/varroa-jump/ref/destructor/vd.fasta
varroavcf=/work/MikheyevU/Maeva/varroa-jump/data/var/primitives.vcf.gz
interval= "BEIS01000007.1:26600000-26690000"
output= "cut7.2"

gatk SelectVariants -R $reference --variant $varroavcf --output /work/MikheyevU/Maeva/varroa-jump/data/var/$output -L $interval
