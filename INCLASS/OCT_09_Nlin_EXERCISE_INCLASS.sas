DATA NLIN_EX;
INPUT X Y;
DATALINES;
4 0.2
6 0.7
8 1.4
10 2.8
12 5.8
14 11.1
16 21.7
18 43.2
20 80.1
;
PROC Nlin;
PARAMETERS a = 0.04 b = 0.4;
MODEL y = a*exp(b*x);
RUN;
