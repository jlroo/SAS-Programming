/*
 * ----EXAM_2---------
 * Author: Jose L Rodriguez
 * Problem: 2
 * Date: November 14th, 2014
 * SAS303 - FALL 2014
 * SAS 9.4 TS Level 1M1 
 */
 
PROC IMPORT OUT=MYOPIA_DATA DATAFILE="/folders/myfolders/SAS303/TAKE_HOME/myopia.xlsx"
			DBMS="xlsx" REPLACE;
			SHEET="myopia1";
			GETNAMES=YES;
RUN;

PROC FORMAT;
VALUE AGEft	low-20="UNDER 20"
			20-29="20 TO 29"
			30-39="30 TO 39"
			40-49="40 TO 49"
			50-59="50 TO 59"
			60-high="60 AND OVER";
RUN;

DATA MYOPIA;
LENGTH PATIENT$ 15;
SET MYOPIA_DATA;
FORMAT AGE AGEft.;
IF lefteye>righteye then PATIENT="LEFT_MYOPIC";
IF righteye>lefteye then PATIENT="RIGHT_MYOPIC";

PROC SORT DATA=MYOPIA;
BY GENDER;
PROC TTEST data=MYOPIA PLOTS=all;
by GENDER;
paired lefteye*righteye;
TITLE "DIFFERENCE BETWEEN LEFT & RIGHT EYE OF PATIENTS WITH MYOPIA";
RUN;

PROC FREQ DATA=MYOPIA;
TABLES GENDER*PATIENT/CHISQ CMH EXACT;
TITLE "ODDS RATIO OF PATIENTS WITH GREATER MYOPIC ON LEFT OR RIGHT EYE";
RUN;

PROC SORT DATA=MYOPIA;
BY AGE;
PROC FREQ DATA=MYOPIA;
TABLES AGE*PATIENT/CHISQ CMH;
TITLE "RISK RATIO OF MYOPIC PATIENTS BY AGE";
RUN;
quit;

/*
a) Use Proc Format to create six age groups: under 20, 20-29, 30-39, 40-49, 50-59, 60 and over.

b) 	Use an appropriate test to determine if there is a significance difference in myopia of the 
	left and right eye of male patients.  Do the same with female patients.  
	You should state which hypothesis test you will use and why, include supporting SAS output.
	You should state the null and alternative hypothesis, the test statistic, the p-value and 
	your conclusion, include the SAS output.
	
	The appropiate hyphothesis test to use in this case is T-test as we want to compare values obtained 
	from two different groups and the samples are independent.
	Hypothesis:
 	H0: (mu1 - mu2) = D0
 	HA: (mu1 - mu2)!= D0 
	*where is D0 some given difference, usually D0 = 0
	
	Ho: The distribution of the data is the same between the left and right eye 
		in patients (males and females).
	Ha: The distribution of the data is not the same between the left and right eye 
		in patients (males and females).
		
	For males the t-value is -4.67 the p-value is 0.0001, the two tests results are highly 
	significant -values, supporting the conclusion of a significant difference between 
	left and right eye in males.
	
	For females the t-value is 0.24  the p-value is 0.8120, the p-value>0.05 indicating that
    there is not a significant difference between left and right eye in females.

c) Call a patient where the right eye is more myopic than the left, rightmyopic and one where the 
	left eye is more myopic, leftmyopic. Determine if rightmyopic or leftmyopic is more prevalent 
	in men or women by performing a Chi-square test and analyzing the odds ratio.
	
	Ho: There is not association between rightmyopic or leftmyopic patient diagnostic and gender
	Ha: There is an association between rightmyopic or leftmyopic patient diagnostic and gender
	
	Since the p-value is 0.0008, the data is significant thefore we reject the NULL hyphothesis. It
	appears to be an association between gender and the type of myopia diagnostic.
	From the Common Odds Ratio and Relative Risks table, the relative risk value is 1.1057 , that means
	the female patients are 1.1057 times more likely to have LEFT MYOPIC than men, with a 95% CI of
	1.0422 to 1.1730, meaning that the true risk of being a female and have left myopic is bewteen 1 and
	1.18 times more likely for females than men.
	
d) Determine if rightmyopic or leftmyopic is more prevalent in certain age groups by performing a 
	Chi-square test. 
	From the Chi-square test we can determine that Rightmyopic and Leftmyopic is more prevalent 
	in the age demographic between 30 to 49 years old this group counts for approximatetly 
	68 percent of the all sample of rigth and left myopic.

*/
