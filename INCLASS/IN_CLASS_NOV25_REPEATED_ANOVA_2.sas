data bpfit2;
 input subj fit1-fit3;
 datalines;
 1 45 50 55
 2 42 42 45
 3 36 41 43
 4 39 35 40
 5 51 55 59
 6 44 49 56
 ;

 proc anova data= bpfit2;
 model fit1-fit3 = /nouni;
 repeated bp 3(1 2 3)/printe; *bp dummy varyable;
 run;
