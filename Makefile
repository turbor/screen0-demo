all:	demo.bin demo3.bin
	openmsx -machine msx2 -diska testdisk -ext moonsound -ext ram4mb -ext debugdevice 
	echo perl  ./deltatime.pl

demo.bin:	demo.asc
	pasmo --msx --nocase demo.asc demo.bin demo.txt
	cp demo.bin testdisk/

demo3.bin:	demo3.asc
	pasmo --nocase demo3.asc demo3.com demo3.txt
	cp demo3.com testdisk/

