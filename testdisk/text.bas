10 SCREEN 0:WIDTH80:CLS:W=256-10-26-26
20 OPEN "text.asc" FOR OUTPUT AS #1
30 READ LA$,X,Y,TX$
31 PRINT TX$
40 IF LA$="$" THEN 200
50 IF LA$="-" THEN 190
60 IF LEN(LA$)>0 THEN PRINT #1,LA$;
70 PRINT #1,CHR$(9);"dw ";HEX$(&H8000+256*Y+X);"  ; x=";X;", y=";Y
80 PRINT #1,CHR$(9);"db ";LEN(TX$);"  ; '";TX$;"'"
90 F=0:FOR I=1TO LEN(TX$):C=ASC(MID$(TX$,I,1))
100 IF C>=ASC("0") AND C<= ASC("9") THEN D=C-ASC("0")+W
110 IF C>=ASC("A") AND C<= ASC("Z") THEN D=C-ASC("A")+W+10
120 IF C>=ASC("a") AND C<= ASC("z") THEN D=C-ASC("a")+W+36
130 IF C=ASC(" ") THEN D=W-1
140 IF F THEN PRINT #1,","; ELSE PRINT #1," db  ";
150 PRINT #1,D;:F=1
160 NEXT
170 PRINT #1,
180 GOTO 30
190 PRINT #1,CHR$(9);"dw 0":GOTO 30
200 PRINT #1,CHR$(9);"dw 0":CLOSE #1
210 DATA "A:",59,46,"2014 David Heremans"
220 DATA "",59,47,"2014 David Heremans"
230 DATA "-",0,0,"-"
240 DATA "B:",0,0,"1234"
250 DATA "",0,1,"1234"
260 DATA "$",0,0,"$"
