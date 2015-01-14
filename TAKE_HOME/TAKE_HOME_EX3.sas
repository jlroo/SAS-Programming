/*
 * ----EXAM_2---------
 * Author: Jose L Rodriguez
 * Problem: 3
 * Date: November 14th, 2014
 * SAS303 - FALL 2014
 * SAS 9.4 TS Level 1M1 
 */

PROC FORMAT;
VALUE GENDERft  1="MALE"
                2="FEMALE";
RUN;

DATA AIRLINES;
INFILE "/folders/myfolders/SAS303/TAKE_HOME/airline.txt" dlm=' ';
LENGTH AIRLINE$ 20;

DO AIRLINE="DELTA","SOUTHWEST","AMERICAN","UNITED";
    DO GENDER= 1 TO 2;
        DO SATISFACTION_i=1 TO 9;
            INPUT SATISFACTION @@;
            OUTPUT;
        END;
    END;
END;
FORMAT GENDER GENDERft.;

*T-TEST - Difference in the passenger satisfaction;
PROC TTEST cochran ci=equal umpu DATA=AIRLINES PLOTS=all;
CLASS GENDER;
VAR SATISFACTION;
TITLE "T-TEST FOR PASSAGER SATISFACTION BY GENDER";
RUN;

*One-Way ANOVA - Difference in the passenger satisfaction ;
PROC SORT DATA=AIRLINES;
BY SATISFACTION;
run;
PROC GLM DATA=AIRLINES;
CLASS AIRLINE;
MODEL SATISFACTION=AIRLINE;
MEANS AIRLINE/tukey;
TITLE "ONE-WAY ANOVA TEST FOR PASSAGER SATISFACTION BY AIRLINE";
run;

/*
 *
 * a) Use your SAS code to open the file and correctly read the data. 
 * 
 * b) Using a t-test, is there a difference in the passenger satisfaction based on gender? 
 *	  Attach and analyze the appropriate SAS output.
 *	
 *		The F-statistic is 0.1528>0.05, the difference of variance is no significant, therefore 
		we use the pooled variance. The T-value is -0.75  and its p-value is 0.4571, the test 
		results are not significant indicating that there isnt not a significant difference between
		passager satisfaction and gender.
 *
 * c) Using a one-way ANOVA, is there a difference in the passenger satisfaction based on airline? 
 *	  Which airlines have similar passenger satisfaction scores and which have different satisfaction 
 *	  scores?  Using you SAS output, explain.
 *		
 *		Yes there is a difference in passager satisfaction based on the airline, we can infer this from
 *		the Student-Newman-Keuls Test and Tukey's Studentized Range (HSD) Test for satisfaction based on
 *		the airline. Also from these test we get that United is at the top of the list with the highest 
 *		passagers satisfaction follow by Delta, American and Southwest that are not significantly 
 *		different of each other (We can see this too in the boxplots).
 *
 *
 * d) What type of recommendation would you tell your boss on passenger satisfaction? Is there any 
 *	airline you would prefer? Is there any airline you would recommend not using? Explain.
 *	
 *		Given that the Mean satisfaction is 75.93056, In terms of passager satisfaction I would 
 *		recommend first United with a mean satisfaction of 84.667 follow by Delta with a mean satisfaction
 *		of 74.722. I wouldnt recommend to flight with American or Southwest as their mean satisfaction is
 *		significally below the mean satisfaction of the industry . 
 *
 * 
 */	