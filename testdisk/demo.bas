10 COLOR 15,0,0:SCREEN 0,0:WIDTH 80:CLEAR 200,&H9FFF
15 PRINT "demo test dither"
20 BLOAD"demo.bin"
25 print input$(1)
30 defusr=&ha000:x=usr(0):end
