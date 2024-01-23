# Example call
# bash 06-1_run_GEM2CHARGEGLI.sh <trait> <exposure> <sex>

# bash 06-1_run_GEM2CHARGEGLI.sh GHB STST female

trait=$1
exposure=$2
sex=$3

model1_output=/data100t1/home/wanying/CCHC/CHARGE_GWAS/202311_Heming_sleep_glycemia/output/chr22_GEM_${trait}_${exposure}_CCHC_${sex}_M1.txt
model2_output=/data100t1/home/wanying/CCHC/CHARGE_GWAS/202311_Heming_sleep_glycemia/output/chr22_GEM_${trait}_CCHC_${sex}_M2.txt

output_fn=PHASE2.CCHC.HIS.${trait}.${exposure}.${sex}.20240122
output_fn=${output_fn^^}.txt # To upper case and add surffix


# snp_info=/vgipiper04/CCHC/TOPMed_postimpute_042022/chr22.info.gz
# SNPIDname=SNP
# INFOname=Rsq
# IMPUTEDname=Genotyped
# snpinfofile_delim=tab

python 06_GEM2CHARGEGLI_python3_WZ.py \
${model1_output} \
${model2_output} \
/vgipiper04/CCHC/TOPMed_postimpute_042022/chr22.info.gz \
${output_fn} \
${exposure} SNP Rsq Genotyped tab