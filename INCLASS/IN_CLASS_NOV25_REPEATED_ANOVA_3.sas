data repeated_anova;
INFILE "C:\Users\jrodriguezorjuela\Desktop\repeatedanovadata.txt" dlm=' ';
INPUT SUBJ ROUTINE $TIME BP;

PROC SORT DATA=repeated_anova;
BY TIME;
ODS GRAPHICS ON;

PROC GLM;
CLASS TIME ROUTINE;
MODEL BP=TIME|ROUTINE;
RUN;
ODS GRAPHICS OFF;

PROC SORT DATA=repeated_anova; * TO USE IN THE RECONFIGURATION DATA;
BY SUBJ;
RUN;
