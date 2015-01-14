Data carat;*ONE SAMPLE T-TEST;
Input diamond; 
DATALINES;
0.46
0.61
0.52
0.48
0.57
0.54 
;
Proc Univariate mu0 = 0.5 alpha = 0.05;*TEST IT AT A 95% CI;
var diamond;
Run;
PROC TTEST h0=0.5;
var diamond;
run;
/*
H0: The average weight of the diamonds is 0.5 carats
HA: The average weight of the diamonds is greater than 0.5 carats.


*/
