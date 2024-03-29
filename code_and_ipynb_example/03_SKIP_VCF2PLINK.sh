# Convert vcf files to PLINK 2.0 pgen format
# This is the expected format of GEM: https://github.com/large-scale-gxe-methods/GEM

# Example call:
# bash 03_SKIP_VCF2PLINK.sh <vcf_file_name> <output_file_name>


# bash 03_SKIP_VCF2PLINK.sh \
# /vgipiper04/CCHC/TOPMed_postimpute_042022/chr22.dose.vcf.gz \
# CCHC_chr22

# Or use this python code to print out commands to run screen
# trait = 'glycemia'
# for chr_num in range(1, 23):
#     vcf_fn = f'/vgipiper04/CCHC/TOPMed_postimpute_042022/chr{chr_num}.dose.vcf.gz'
#     cmd = f'screen -dmS {trait}_chr{chr_num}; screen -S {trait}_chr{chr_num} -X stuff '
#     plink_cmd = f"plink2 --vcf {vcf_fn} 'dosage'=DS --out CCHC_chr{chr_num};exit\\n"
#     cmd = f'{cmd} "{plink_cmd}"'
#     print(cmd)

vcf=$1
output=$2

plink2 \
--vcf ${vcf} 'dosage'=DS \
--out ${output}