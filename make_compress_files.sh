for file in *c.dir_2
do
	echo $file
	echo 'new_val'
	sed -e "s/filein/$file/g" make_new_val0.F90 > make_new_val.F90
	gfortran make_new_val.F90
	./a.out
	echo 'compress'
	sed -e "s/filein/$file/g" make_compress_file_300m0.F90 > make_compress_file_300m.F90
	gfortran make_compress_file_300m.F90 
	./a.out
	rm -f ${file}2
	#rm -f ${file}
done