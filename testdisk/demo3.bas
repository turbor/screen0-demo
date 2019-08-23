10 COLOR 15,0,0:SCREEN 0,0:WIDTH 80:CLEAR 200,&HBFFF
15 PRINT "demo blob patterns"
20 BLOAD"demo3.bin"
25 print input$(1)
30 defusr=&hc000:x=usr(0):end
