# script to convert plink grm to mmap reading UNCOMPRESSED file directly
mmap=/data100t1/home/wanying/downloaded_tools/mmap/mmap.2022_05_15_16_58.intel

# plink grm from step 1
plink_square_rel_matrix=/data100t1/home/wanying/CCHC/output/plink_CCHC_grm.rel
plink_id_file=/data100t1/home/wanying/CCHC/output/plink_CCHC_grm.rel.id

# Output grm file name fro MMAP
# The actual output file name used is:
# mmap_grm_filename=/belowshare/vumcshare/data100t1/home/wanying/CCHC/output/mmap_CCHC_grm.rel.bin
mmap_grm_filename=mmap_out.rel.bin

# Single column file with no header of the individuals included in the analysis
# Note: This does not work in GRM conversion, but will not affect GWAS
subject_set_file=/data100t1/home/wanying/CCHC/CHARGE_GWAS/202311_Heming_sleep_glycemia/supporting_files/subject_set.txt

$mmap \
--matrix_grm2mmap \
--binary_output_filename ${mmap_grm_filename} \
--tab_delimited \
--header_present \
--subject_id_filename ${plink_id_file} \
--txt_input_filename ${plink_square_rel_matrix}
--subject_set ${subject_set_file} \