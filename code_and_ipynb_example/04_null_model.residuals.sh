# Run null model in MMAP

# Example call
# bash 04_null_model.residuals.sh MFBG


mmap=/data100t1/home/wanying/downloaded_tools/MMAP_20221106/mmap.2022_11_06_21_46.intel

#pedigree file  
ped=/belowshare/vumcshare/data100t1/home/wanying/CCHC/CHARGE_GWAS/202311_Heming_sleep_glycemia/supporting_files/ped.csv

# phenotype file
pheno=/belowshare/vumcshare/data100t1/home/wanying/CCHC/CHARGE_GWAS/202311_Heming_sleep_glycemia/supporting_files/sleep_trait_covar.with_residuals.csv

# Use MMAP GRM. No need to subset
covariance_matrix=/belowshare/vumcshare/data100t1/home/wanying/CCHC/output/mmap_CCHC_grm.rel.bin

# trait and covariates assumed to be in phenotype file
trait=$1 # MFBG or GHB for glycimia traits

# sex=$2

# num threads, increase for faster compute/large samples
num_mkl_threads=4

# CHOOSE COVARIATES TO ADJUST OUT
# covariates=" age age2 " 
# covariates=" sex age age2 " # For sex combined
# covariate_str=" --covariates ${covariates} " 

# if NO covariate adjustment, remove comment 
covariate_str="  " 

# set suffix for MMAP null model files 
# Cannot include path to directory otherwise will see "Segmentation fault"
mmap_output_suff=grm

# --phenotype_id: the column name containing genotype IDs such as BD0009_BD4009
$mmap \
--ped ${ped} \
--trait $trait \
${covariate_str} \
--file_suffix \
$mmap_output_suff \
--phenotype_filename $pheno \
--phenotype_id genotype_ID \
--single_pedigree \
--num_mkl_threads ${num_mkl_threads} \
--read_binary_covariance_file \
${covariance_matrix}
