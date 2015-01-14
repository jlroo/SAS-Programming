DATA HODGKIN_2;
/*
INCLASS EXERCISE SEPTEMBER 25TH
H0: The probability of having Hodgkin’s disease is the same whether tonsils are removed or not.
HA: The probability of having Hodgkin’s disease is not the same whether tonsils are removed or not.
P(yes/no) = P(no/yes) = 0.5
*/
INPUT H_PATIENT S_PATIENT COUNT;
DATALINES;
YES YES 26
YES NO 15
NO YES 7
NO NO 37
;
PROC FREQ DATA=HODGKIN_2 ORDER=DATA;
TABLES  /CHISQ;
RUN;
