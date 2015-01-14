DATA CRIME;

INPUT CRIME$ ALCOHOL$  COUNT;

DATALINES;
ARSON YES 50
ARSON NO 43
RAPE YES 88
RAPE NO 62
VIOLENCE YES 155
VIOLENCE NO 110
STEALING YES 379
STEALING NO 300
COINING YES 18
COINING NO 14
FRAUD YES 63
FRAUD NO 144
;

PROC FREQ DATA=CRIME ORDER=DATA;
TABLES CRIME*ALCOHOL /CHISQ DEVIATION EXPECTED;
WEIGHT COUNT;
RUN;

/*
b. State the Null and Alternative Hypothesis for the Chi-Square test

*****Null Hypothesis (Ho)*****
There is no difference, association or dependency 
between types of crimes and consumption of alcohol.

*****Alternative Hypothesis (H1)*****
There is a coorelation between the consume of alcohol and the type of crime.

c. State the conclusion a 95% confidence level. Include the test statistic 
and p-value in your conclusion.
The chi-square test statistic value is 49.7306 	p-value is less than 0.0001 meaning
that with a 95% confidence we can say that there is not a correlation between the
consumption of alcohol and the type of crime commited that can be determine from this
sample.

d. Based on this data, does it appear that drinkers are more likely to commit crimes? 
Justify your answer. Look for anything unusual in the output.
From this data we cant infer that drinkers are more likely to commit crimes and we
can see an outlier in the fraud crimes where 10.10% were committed by a non-drinker
and just 4.42% by a drinker at of 14.52%  

*/