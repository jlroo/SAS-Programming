/*
 * ----ASSIGMENT_4---------
 * Author: Jose L Rodriguez
 * Assigment: 4
 * Problem:  1
 * Date: October 2nd, 2014
 * SAS303 - FALL 2014
 * SAS platform 'Linux LIN X64 2.6.32-431.11.2.el6.x86_64' 
 * SAS version '9.04.01M1P12042013' 
 *
 */
DATA ASTHMA;
INPUT SOC_STATUS$ ASTHMA_IND$ COUNT;
DOUBLECOUNT=COUNT*2;
DATALINES;
LOW YES 40
HIGH YES 30
LOW NO 100
HIGH NO 130
;
PROC FREQ DATA=ASTHMA ORDER=DATA;
TABLES SOC_STATUS*ASTHMA_IND /CHISQ CMH;
WEIGHT COUNT;
RUN;
PROC FREQ DATA=ASTHMA;
TABLES SOC_STATUS*ASTHMA_IND /CHISQ;
WEIGHT DOUBLECOUNT;
RUN;
/**

a.	State the Null and Alternative Hypothesis for the Chi-Square test

Ho: There is no relationship between socio economic status and asthma
giving that the subject belongs to one of the three socio economic status.

Ha: There is a relationship between the socio economic status and asthma when 
giving that the subject belongs to one of the three socio economic status.

b.	State the conclusion
Non-significant Cochran-Mantel Haenzel test tells us that after there’s no 
evidence of an association between socio economic status and asthma. 

c.	Interpret the relative risk ratio, What is the 95% CI and interpret this.
CRUDE RATIO 
Socio Economics vs. Asthma: 1.7333

CRUDE RR 
Asthma vs. Socio Economics = 1.5238 (1.0057,2.3088)

Conclusion: People from low socio economic status are 52% more likely to 
have asthma, and we can say that we are 95% certain that the true population odd ratio
is in the interval somewhere between 1.0057 and 2.3088.

g.	Compare the chi-square value and p-value to part B.  
	Why is it important to do a Chi-square test on the actual frequencies 
	rather than rates or percents?
	
Chi-square must be calculated on actual count data, not substituting 
percentages, which would have the effect of pretending the sample size. As Chi-square 
test is only meant to test the probability of independence of a distribution of data.
In this case the hypothesis observed chi-squareis are not significantly different 
from expected, something that isnt true because we double counted the data.

***PART_A***
Chi-Square 	1 	4.0262 	0.0448
***PART_B***
Chi-Square 	1 	8.0524 	0.0045

**/