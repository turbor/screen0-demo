10 MAXFILES=2
20 COLOR 15,0,0:SCREEN5
30 OPEN "bigf.asc" FOR OUTPUT AS #1
40 OPEN "grp:" FOR OUTPUT AS #2
50 PRINT #1,"bigfontdata ; {{{"
60 A$="0123456789":GOSUB120
70 A$="ABCDEFGHIJ":GOSUB120
75 A$="KLMNOPQRST":GOSUB120
77 A$="UVWXYZ":GOSUB120
80 A$="abcdefghij":GOSUB120
85 A$="klmnoparst":GOSUB120
87 A$="uvwxyz":GOSUB120
90 PRINT #1," ; }}}"
100 CLOSE #1
110 END
120 CLS:PRESET(0,0):PRINT#2,A$
130 FOR X=255TO0STEP-1:COPY(INT(X/3),0)-(INT(X/3),50) TO (X,0):NEXT
140 FOR X=25TO0STEP-1:COPY(0,INT(X/3))-(255,INT(X/3)) TO (0,X):NEXT
150 FOR X=0TOLEN(A$)*24-1
160 IF (XMOD24)=0 THEN PRINT #1,"; ";MID$(A$,1+(X/24),1)
170 PRINT #1,"  db ";
180 D=0:FOR Y=23TO16STEP-1:GOSUB 230:NEXT:GOSUB 250:PRINT #1,",";
190 D=0:FOR Y=15TO8STEP-1:GOSUB 230:NEXT:GOSUB 250:PRINT #1,",";
200 D=0:FOR Y=7TO0STEP-1:GOSUB 230:NEXT:GOSUB 250:PRINT #1,""
210 NEXT X
220 RETURN
230 D=D*2:IF POINT(X,Y)=15 THEN D=D+1
240 RETURN
250 PRINT #1,"%"+RIGHT$("00000000"+BIN$(D),8);:RETURN
