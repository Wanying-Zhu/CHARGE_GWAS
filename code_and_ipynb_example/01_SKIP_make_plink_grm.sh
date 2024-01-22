# Use preimputation files
bfile=/vgipiper04/CCHC/QC_preimputed_cleandata_APR22/preimputation_b38_TOPMed_aligned/CCHC_rescan_nodups_v2_nobatchsnps_b38-updated
out=output
# The actual output file name used:
# out=/belowshare/vumcshare/data100t1/home/wanying/CCHC/output/plink_CCHC_grm


# MMAP needs a sequre matrix
plink2 \
--make-rel square \
--bfile ${bfile} \
--out  ${out}