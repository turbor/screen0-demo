10 DATA 1, 2, 3, 4, 5, 5, 6, 6, 8, 8, 9, 10, 10, 11, 12, 14, 16, 17, 19, 21, 23, 24, 26, 27, 28, 29, 30, 31, 31, 31, 31, 31
20 SCREEN 8:COLOR 255,0,0:CLS
30 FOR I=0TO31:READ C
40 CIRCLE(31,31),31-I,C
45 CIRCLE(31,32),31-I,C
50 PAINT (31,31),C,C
60 NEXT
70 OPEN "data.asc" FOR OUTPUT AS #1
80 PRINT #1,"blobdata ; {{{"
90 FOR Y=0TO63
91 l=-1:o=-1
92 FOR X=0TO63:C=POINT(X,Y)
93 IF O=-1 AND C<>0 THEN O=X
94 IF C<>0 THEN L=1+X-O
95 NEXT
96 LA$="blobdata"+MID$(STR$(Y),2)
110 PRINT #1,LA$;": db ";O;",";L;"  ";
120 FOR X=O TO O+L-1
130 C=POINT(X,Y)
135 PSET(X,Y),255
140 PRINT #1,",";C;
150 NEXT
160 PRINT #1,""
170 NEXT
180 PRINT #1," ; }}}"
190 CLOSE #1
200 PRINT INPUT$(1)

