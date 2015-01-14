/*
 * ----ASSIGMENT_5---------
 * Author: Jose L Rodriguez
 * Assigment: 5
 * Problem: 1
 * Date: October 17th, 2014
 * SAS303 - FALL 2014
 * SAS 9.4 TS Level 1M1 
 * W32_7PRO platform
 */
DATA RANDOM_SAMPLE;
INPUT BLOOD_TYPE$ OBSERVED;
DATALINES;
A 89
B 18
AB 12
0 81
;
PROC FREQ DATA=RANDOM_SAMPLE ORDER=DATA;
TABLES BLOOD_TYPE/ CHISQ TESTP=(41 10 4 45);
WEIGHT OBSERVED;
TITLE "Blood Phenotype Random Sample ";
RUN;
