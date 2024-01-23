# Example call:
# ##### Model 1 ##### 
# bash /data100t1/home/wanying/CCHC/CHARGE_GWAS/202311_Heming_sleep_glycemia/code/05_GEM_GWAS_model1_and_2.sh \
# 22 GHB combined LTST \
# /data100t1/home/wanying/CCHC/CHARGE_GWAS/202311_Heming_sleep_glycemia/supporting_files/phenotype_files/GHB.sleep.combined.pheno.csv
# ##### Model 2 #####
# bash /data100t1/home/wanying/CCHC/CHARGE_GWAS/202311_Heming_sleep_glycemia/code/05_GEM_GWAS_model1_and_2.sh \
# 22 GHB combined none \
# /data100t1/home/wanying/CCHC/CHARGE_GWAS/202311_Heming_sleep_glycemia/supporting_files/phenotype_files/GHB.sleep.combined.pheno.csv

chr_num=$1
trait=$2
sex=$3
exposure=$4
pheno_file=$5

# Check if model 1 or model 2 needs to be run
if [ $exposure != "none" ]
then
    echo "Running model 1: chr${chr_num}, trait=${trait}, sex=${sex}"
    covars="age age2 PC1 PC2 PC3 PC4 PC5 age*${exposure} age2*${exposure}"
    out_fn="chr${chr_num}_GEM_${trait}_${exposure}_CCHC_${sex}_M1.txt"
    exposure_str="--exposure-names ${exposure}"
    # Check if sex combined or not (combined, female or male)
    if [ $sex = "combined" ]
    then
        covars="${covars} sex sex*${exposure}"
    fi
else
    echo "Running model 2: chr${chr_num}, trait=${trait}, sex=${sex}, exposure=${exposure}"
    covars="age age2 PC1 PC2 PC3 PC4 PC5"
    out_fn="chr${chr_num}_GEM_${trait}_CCHC_${sex}_M2.txt"
    exposure_str=""
    # Check if sex combined or not (combined, female or male)
    if [ $sex = "combined" ]
    then
        covars="${covars} sex"
    fi
fi

path=/data100t1/home/wanying/CCHC/CHARGE_GWAS/202311_Heming_sleep_glycemia/supporting_files/phenotype_files
genotype_path=/data100t1/home/wanying/CCHC/CHARGE_GWAS/GEM_genotype_files

/data100t1/home/wanying/downloaded_tools/GEM/GEM_1.4.5_static \
--pfile ${genotype_path}/CCHC_chr${chr_num} \
--pheno-file ${path}/${trait}.sleep.${sex}.pheno.csv \
--sampleid-name EGO \
--pheno-name ${trait}_ERROR_RESIDUAL_winsorized \
--covar-names ${covars} \
--robust 1 \
--center 0 \
--output-style meta \
--out ${out_fn} \
${exposure_str} \



