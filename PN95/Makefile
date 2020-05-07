data.dat : PN95demand_timeseries_data.json Makefile
	cp $< $@
	sed -i 's/],/\n/g' $@
	sed -i 's/\[//g' $@
	sed -i 's/\]//g' $@
	sed -i 's/,/\t/g' $@
	sed -i 's/"data":/\n/g' $@
	sed -i 's/{/\n\n\n#/' $@


