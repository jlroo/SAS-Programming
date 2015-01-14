data bpfit;
do test = 1 to 3;
do subject = 1 to 6;
 input bpressure @@;
 output;
 end;
 end;
 datalines;
 45 42 36 39 51 44
 50 42 41 35 55 49
 55 45 43 40 59 56
 ;

Proc ANOVA ; *repeated anova decrease error;
Class test subject;
Model bpressure = test subject ;
run;


 
