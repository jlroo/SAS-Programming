DATA HOUSES;
INPUT Property Assessor_A Assessor_B;
CHANGE = ASSESSOR_A - Assessor_B;
DATALINES;
1 276.3	275.1
2 288.4	286.8
3 280.2	277.3
4 294.7	290.6
5 268.7	269.1
6 282.8 281
7 276.1 275.3
8 179 179.1
;

PROC UNIVARIATE;
VAR CHANGE;
RUN;
PROC TTEST;
PAIRED ASSESSOR_A*ASSESSOR_B;
RUN;
/*
########### GENERAL NULL HYPOTHESIS #############
Null Hypothesis is that the distributions of the two data sets is the same.  

########### SIGN TEST ##########################
SIGN TEST -> IMPROVEMENT VS NOT IMPROVEMENT
Test is based on the difference of the two means from dependent  data. 

*/
