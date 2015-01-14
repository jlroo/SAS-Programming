DATA POLITICS;
INPUT AGREEMENT$ APPROVAL_NUM; 
DATALINES;
YES	20
YES/NO	5
NO/YES	10
NO/NO	10
;
PROC FREQ DATA=POLITICS ORDER=DATA;
TABLES AGREEMENT*APPROVAL_NUM/CHISQ;
RUN;

/*
	        		W_APP	W_APP
					Yes		No		Total
H_APP 	Yes			20		5		25
H_APP 	No			10		10		20
		Total		30		15		45

a)	 Explain why you would use the McNemar’s test to evaluate this data?
b)	State the Null and Alternative Hypothesis to perform the McNemar’s test on this data.
c)	Write the SAS code to perform the McNemar’s test.
d)	State the Chi-Square value, the p-value and your conclusion at a 95% confidence level.

*/
