# LAI_treatement

details how to create LAI files for ECOCLIMAP_SG
  ## 0. Download the ECO-SG LAI 
Follow the instruction from https://opensource.umr-cnrm.fr/projects/ecoclimap-sg/wiki 
and I mainly work with these
LAI/300M: contains the 36 couples of compressed files LAI_MMJJ_c.dir.gz and LAI_MMJJ_c.hdr.gz, one couple for each 10-day period. These LAI data come from the 2014-2016 copernicus satellite LAI data at 300m-resolution.
  ## 1. Uncompress ECO-SG files
run make_uncompress.sh in the directory containing the ECOCLIMAP-SG LAI data

