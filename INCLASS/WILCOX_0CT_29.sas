DATA dietary;
INPUT diet count;
DATALINES;
lcdiet 42.3 lcdiet 51.5 lcdiet 53.7 lcdiet 48.0 lcdiet 56.0
lcdiet 55.7 lcdiet 54.8 lcdiet 52.8 lcdiet 51.3 lcdiet 58.5 
lcdiet 55.4 lcdiet 38.3 lcdiet 54.1 lcdiet 52.1
normal 42.1 normal 30.7 normal 55.8 normal 55.1
normal 47.5 normal 63.6 normal 57.8 normal 61.8
normal 32.6 normal 53.7 
;
PROC TTEST;
class diet;
var count;
RUN;
/*
Null Hypothesis is that the distribution of the data is the same between the groups.
*/
