# LAI_treatement

details how to create LAI files for ECOCLIMAP_SG
  ## 0. Download the ECO-SG LAI 
Follow the instruction from https://opensource.umr-cnrm.fr/projects/ecoclimap-sg/wiki 
and I mainly work with these
LAI/300M: contains the 36 couples of compressed files LAI_MMJJ_c.dir.gz and LAI_MMJJ_c.hdr.gz, one couple for each 10-day period. These LAI data come from the 2014-2016 copernicus satellite LAI data at 300m-resolution.
  ## 1. Uncompress ECO-SG files
  ### 1.1 uncompress all the .gz file
This will lead to LAI_MMJJ_c.dir LAI_MMJJ_c.hdr
  ### 1.2 Copy run make_uncompress.sh and uncompress_file_300m0.F90 in the folder containing LAI_MMJJ_c.dir LAI_MMJJ_c.hdr couples
  ### 1.3 run make_uncompress.sh
this will create LAI_MMJJ_c.dir_2 file a file that can be read outside surfex
## 2.

