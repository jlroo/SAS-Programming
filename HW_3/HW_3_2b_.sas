/*
 * ----ASSIGMENT_2---------
 * Author: Jose L Rodriguez
 * Assigment: 3
 * Probleml:  2b
 * Date: September 25th, 2014
 * SAS303 - FALL 2014
 * SAS platform 'Linux LIN X64 2.6.32-431.11.2.el6.x86_64' 
 * SAS version '9.04.01M1P12042013' 
 *
 * 
 * 
 */

DATA URBAN_DEVELOP;
SET WORK.URBAND;
SALES_X_SQF = (SALES)/(SQF);
/* 	LABELS type of items they sell*/
LABEL 		A="Hardware" B="Grocery" C="General Merchandise" D="Furniture"
			E="Electronics"
			F="Video and Music"
			G="Restaurant Services"
			YIB="Years in Business"
			SQF="Square Footage"
			SIC="Standard Industrial Classification";

IF CHAR(ID,1) = "A" THEN ZIPCODE = 60612; 
ELSE IF CHAR(ID,1) = "B" THEN ZIPCODE = 60622;
ELSE IF CHAR(ID,1) = "C" THEN ZIPCODE = 60624;
ELSE IF CHAR(ID,1) = "D" THEN ZIPCODE = 60634;
ELSE IF CHAR(ID,1) = "E" THEN ZIPCODE = 60639;

PROC SORT DATA=URBAN_DEVELOP;
BY ZIPCODE;
PROC FREQ DATA= URBAN_DEVELOP;
TABLES ZIPCODE*(SIC A -- G);
TABLES SIC*ZIPCODE/CHISQ;*Chi-square test on type of store (SIC)per zip codes;
PROC MEANS DATA= URBAN_DEVELOP MEAN STD MEDIAN QRANGE;
BY ZIPCODE;
VAR YIB SALES SALES_X_SQF;
RUN;

/*
Do any of the zip codes appear to be food deserts and why?
From the tables  we can see that zipcode 60612 may be a food desert , if we compare 
the frequency in table B and SIC for this zipcode we can see what may be a significance
difference compare with other zipcodes.
  
(i) Compare the years in business variable between the zip codes. 
Does there seem to be an a zip code that is more or less stable.
Looking at the standard deviation of the mean table we can see 
that zipcode 60634 as an smaller standard deviation meaning that businesses in that
zipcode dont change that frequently. 

(ii) Compare the mean sales. Does one zip code look like it generates 
more or less sales than other zip codes. 
Looking at the sales per square feet and overall sales we can see that zipcode
60634 generates more revenues than the others. 
Do these trends (if any exist) persist with sales per square feet.
The same conditions persist for sales per square feet with the only variation that for
zipcode 60622 the spread is larger(IQR) meaning that there is a greater variation 
in the sales per square feet for zipcode 60622.

(i) State the Null and Alternative Hypothesis determine whether there is a 
significant relationship between store (SIC) and zip codes.
*****Null Hypothesis (Ho)*****
There is no difference, association or dependency 
between the type of store (SIC) and the zipcode.
*****Alternative Hypothesis (H1)****
There is a coorelation between the type of store and the zipcode.	 	

(ii) State the test statistic, the p-value and your conclusion.
To answer our hypothesis we can look at the Chi-Square, to find that the 
chi-square test statistic value is 14.3027 and the associated p-value is 0.8148. 
As  chi-squared is larger than the 0.05 (critical point) we have to reject the null 
hypothesis and conclude that there is a correlation between the zipcode and SIC.
 
(iii) Why might the Chi-Square test of independence not be the best hypothesis test?
SAS give us a WARNING: 70% of the cells have expected counts less than 5. Chi-Square may not be a valid test.
In this cases it is better to use the Fisher’s Exact Test taking in count that we need a 2X2 table
where that makes and association between the row and column variables. This test assumes that 
the row and column totals are fixed, and then uses the hypergeometric distribution to compute 
probabilities of possible tables conditional on the observed row and column totals. Fisher’s exact 
test does not depend on any large-sample distribution assumptions, and so it is appropriate 
even for small sample sizes and for sparse tables. 
*/
 