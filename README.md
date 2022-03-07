# LAI_treatement
This repository describes how to overwrite or add LAI data to the existing ECOCLIMAP-SG climatology, it uses a mix of python scripts and FORTRAN scripts produces in the ECOCLIMAP-SG Wiki  https://opensource.umr-cnrm.fr/projects/ecoclimap-sg/wiki 
  ## 0.1 Download the ECO-SG LAI 
Follow the instruction from https://opensource.umr-cnrm.fr/projects/ecoclimap-sg/wiki 
and I mainly work with these
LAI/300M: contains the 36 couples of compressed files LAI_MMJJ_c.dir.gz and LAI_MMJJ_c.hdr.gz, one couple for each 10-day period. These LAI data come from the 2014-2016 copernicus satellite LAI data at 300m-resolution.
  ## 0.2 Get your LAI
 
  ## 1. Uncompress ECOCLIMAP-SG files
  ### 1.1 uncompress all the .gz file
This will lead to LAI_MMJJ_c.dir LAI_MMJJ_c.hdr
  ### 1.2 Copy run make_uncompress.sh and uncompress_file_300m0.F90 in the folder containing LAI_MMJJ_c.dir LAI_MMJJ_c.hdr couples
  ### 1.3 run make_uncompress.sh
this will create LAI_MMJJ_c.dir_2 file a file that can be read outside surfex
## 2. Overwrite the uncompressed ECOCLIMAP-SG (run LAI_2020_to_hdr.ipynb)
This will pick all the LAI files in your direcosg folder and all the files in your dire folder (folder containing Copernicus tif files) and create a subdirectory (suffix) in the dire folder containing uncompressed ECOCLIMAP-SG LAI data (LAI_MMJJ_c.dir_2) overwritten by the Copernicus files in the area covered by the Copernicus data.
It assumes that both folder contains the same 10 days period.
## 3. Recompress the new LAI files
### 3.1 Copy make_compress_files.sh, make_compress_file_300m0.F90, make_new_val0.F90 in the folder containing the outputs of LAI_2020_to_hdr.ipynb
### 3.2 Set the ECOCLIMAP-SG file path in make_new_val0.F90 line 10
open(11,file=$mypath,form='unformatted',access='direct',recl=43200*3)

### 3.3 run make_compress_files.sh
Once you run it the files are ready to be used in SURFEX/HARMONIE HAROME just rename them as .dir

## 4. Check the new file
### 4.1 Copy run make_uncompress.sh and uncompress_file_300m0.F90 in the folder containing LAI_MMJJ_c.dir_2c LAI_MMJJ_c.hdr couples







