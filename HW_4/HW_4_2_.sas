/*
 * ----ASSIGMENT_4---------
 * Author: Jose L Rodriguez
 * Assigment: 4
 * Problem:  2
 * Date: October 2nd, 2014
 * SAS303 - FALL 2014
 * SAS platform 'Linux LIN X64 2.6.32-431.11.2.el6.x86_64' 
 * SAS version '9.04.01M1P12042013' 
 *
 */

DATA VITAMINS;
INPUT USE_VITAMINS$ USE_CONTROL$ VITAMINS_COUNT;

DATALINES;
YES YES 100
YES NO 50
NO YES 90
NO NO 200
;

PROC FREQ DATA=VITAMINS ORDER=DATA;
TABLES USE_VITAMINS*USE_CONTROL /AGREE;
WEIGHT VITAMINS_COUNT;
RUN;

/*
A matched-pairs case-control study is conducted. Each case (a person with disease X) 
is matched to a single control, based on age (plus or minus 2 years) and gender. 
Each person is then asked if he/she used multivitamins regularly in the past year.

a.	State the Null and Directional Alternative Hypothesis for  McNemar’s test.

Ho : The consuption of multivitamins regularly helped fight the disease.
Ha : The consuption of multivitamins regularly doesnt have any effect on the treatment.

b.	Answer the question “Are the cases more or less likely to have used vitamins?” 
	Justify this with your p-value.
From the table we have that McNemar's chi-squate statistics is 11.4286, with a
corresponding p-value of 0.0007. We can conclude that the consuption of vitamins doesnt
have any effect on the treatment of the disease.

*/