/*PAIRED DATA T-TEST*/
DATA CAFFEINE;
INPUT SUBJ BASELINE CAFFEINE;
DATALINES;
1 6.37 4.52
2 5.69 5.44
3 5.58 4.7
4 5.27 3.81
5 5.11 4.06
6 4.89 3.22
7 4.7 2.96
8 3.53 3.2
;
PROC TTEST;
PAIRED BASELINE*CAFFEINE;
RUN;

/*
H0:  The mean MBF is the same before and after taking caffeine
HA: The mean MBF is not the same before and after taking caffeine
*/
