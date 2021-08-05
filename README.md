# LAI_treatement

details how to create LAI files for ECOCLIMAP_SG
  ## 0.1 Download the ECO-SG LAI 
Follow the instruction from https://opensource.umr-cnrm.fr/projects/ecoclimap-sg/wiki 
and I mainly work with these
LAI/300M: contains the 36 couples of compressed files LAI_MMJJ_c.dir.gz and LAI_MMJJ_c.hdr.gz, one couple for each 10-day period. These LAI data come from the 2014-2016 copernicus satellite LAI data at 300m-resolution.
  ## 0.2 Download the Copernicus data
 Data are available here I don't think there is an automatic way to download these rather than through the website user interface https://land.copernicus.eu/global/products/LAI
 You should end up with an ensemble of tiff files for each 10 days period
 
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
### 3.1 Copy 



## 4. Check the new file
### 4.1 Copy run make_uncompress.sh and uncompress_file_300m0.F90 in the folder containing LAI_MMJJ_c.dir_2c LAI_MMJJ_c.hdr couples







