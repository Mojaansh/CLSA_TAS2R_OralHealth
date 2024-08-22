#!/bin/bash
BGEN=/home/mojan/Mojan_data/Genetics/Genomics3_clsa
IMP=/home/mojan/Mojan_data/Genetics/Genomics3_clsa/imp.new
#previous convert to plink code
#for chr in {5,7,12}
#do
#plink2--bgen $BGEN/clsa_imp_${chr}_v3.bgen ref-first \
      # --sample $BGEN/clsa_imp_v3.sample --hwe 1e-6 --geno 0.05 \
       #--allow-extra-chr --max-alleles 2 --make-bed \
    #   --out $BGEN/imp.bew/clsa_imp_${chr}_v3
#done

# Convert to plink format.
for chr in {5,7,12}
do
plink2 --bgen $BGEN/clsa_imp_${chr}_v3.bgen ref-first \
        --sample $BGEN/clsa_imp_v3.sample --hwe 3.15e-10 \
        --allow-extra-chr --make-bed \
        --out $IMP/clsa_imp_${chr}_v3
done



#Convert to PLINK2 format
for chr in {5,7,12}
do
plink2 --bfile $IMP/clsa_imp_${chr}_v3 \
        --make-pgen \
        --out $IMP/clsa_imp_${chr}_v3
done
