/*
 * ----ASSIGMENT_5---------
 * Author: Jose L Rodriguez
 * Assigment: 8
 * Problem: 2
 * Date: December 5th, 2014
 * SAS303 - FALL 2014
 * SAS 9.4 TS Level 1M1
 * W32_7PRO platform
 */
PROC IMPORT OUT=Flushot
            DATAFILE="/folders/myfolders/SAS303/HW_8/FluShot.xlsx"
            DBMS="xlsx" REPLACE;
        SHEET="Sheet1";
        GETNAMES=YES;
RUN;

DATA Health;
        SET Flushot;


ods graphics / reset width=6.4in height=4.8in imagemap;
proc sgplot data=WORK.HEALTH noautolegend;

        scatter x=Age y=FluShot / transparency=0.00 name='Scatter';
        xaxis grid;
        yaxis grid; 
run;
ods graphics off;

PROC LOGISTIC DESCENDING;
MODEL FluShot=age/ RISKLIMITS pprob=1 outroc=ROCData ;
OUTPUT OUT=LOG_FLU_OUT PREDICTED=Pre_FluShot;
title "FIRST MODEL FLUSHOT=AGE";
RUN;

PROC SORT;
BY AGE;
Proc Gplot  data = LOG_FLU_OUT;
Plot Pre_FluShot*age;
Run;


PROC LOGISTIC DESCENDING;
MODEL FluShot=age HealthAwareness HealthIns/ RISKLIMITS lackfit pprob=1 outroc=ROCData ;
OUTPUT OUT=fulllogfluout PREDICTED=full_flu;
title "FIRST MODEL FLUSHOT=AGE HealthAwareness HealthIns";
RUN;
quit;

PROC SORT;
BY AGE;
Proc Gplot data = fulllogfluout;
Plot full_flu*age;
Run;

PROC G3GRID DATA=fulllogfluout  OUT=flue_3D;
GRID age*HealthIns=FluShot/
    AXIS1=25 TO 75 BY 1
    AXIS2=0 TO 2 BY 0.25;
RUN;

PROC G3D DATA=flue_3D;
PLOT age*HealthIns=FluShot/ROTATE=75 TILT=75;
RUN;


PROC LOGISTIC DESCENDING;
MODEL FluShot=age HealthAwareness HealthIns/ selection=forward ;
OUTPUT OUT=fulllogfluout PREDICTED=full_flu;
title "FIRST MODEL FLUSHOT = AGE HealthAwareness HealthIns FORWARD";
RUN;
quit;   

/*
	2)  Flu Shot:  The file FluShot.xlsx contains data on 50 subjects; age, healthawareness, 
		healthins, flushot.  The variable HealthAwareness is a score between 0 and 100 for a subject’s 
		awareness of health issues. HealthIns corresponds to the subject’s health coverage;  
		0 = no health insurance, 1 = minimal health insurance,  2 = more than minimal insurance.  
		
		The variable flu shot is a binary variable which indicates if the subject received a 
		flu shot (1) or did not (0) for the upcoming flu season.

	a)  Create a scatter plot flu shot versus age and analyze the plot.  Does there appear to 
		be any issue with separation for a logistic regression analysis? Explain. Include the 
		scatterplot.
		
		For a logistic regression to occur the dependent variable nnes to have two levels (binary)
		in this case we case see in the graph that the variable has two levels also the model range
		is between 0 and 1 and fits logaritmic transformation.
	
	b) Write the code to perform a logistic regression on the flu shots with age as the regressor 
	   (independent variable) and a probability model of flushot = 1. Include the risk limits tables 
		and the Receiver Operating Characteristic Curve output.  Output the predicted values to 
		the dataset logfluout. Write the code to produce the probability plot.
	
	1) Is the model statistically significant at the 95% CL.?  Include the Global Output table.
		Yes the model is significant at 95% confidence level according to the Global output table,
		the three test as less than 0.05.

	2)  What is the equation for the odds of the getting a flu shot based on age?  
	
		y = -6.5910 + 0.1334(age)
	
		What is the equation to calculate the probability a person gets a flu shot base on their age? 
		
		    [e^{-6.5910 + 0.1334(age)}]
	  p = --------------------------------
		   	1 + e^{-6.5910 + 0.1334(age)}
		
	 Fill in the following chart
  __________ _______________________________________ _______________________________________________
 |____Age___|_____Odds a person got a flu shot______|______Probability a person got a flu shot______|
 |			|										|												|
 |	 23		|			 -3.5						|					0.0286704					|
 |	 37		|			 -1.65						|					0.160407					|
 |	 60		|		      1.4						|					0.804239					|
 |__________|_______________________________________|_______________________________________________|

	3) Include the odds ratio estimate and include an explanation of what this means.
	 _____________________________________________________
	|													  |
	| Odds Ratio Estimates and Wald Confidence Intervals  |
	|_____________________________________________________|
	|		  |		   |			|					  |
	| Effect  |	Unit   |Estimate 	|95% Confidence Limits|
	|		  |		   |			|			|		  |
	| Age 	  |	1.0000 | 1.143 		|	1.046 	|	1.24  |
	|_________|________|____________|___________|_________|
	
	Since we are looking at age a numerical value, the odds ratio gives us the odds of getting the flue shot
	increase as the age increase. 
	
	4) Include the ROC curve.
	
c)  Adapt your code to perform a logistic regression on the flu shots including all 
	the regressors (age, healthawareness, healthins) and a probability model of 
	flushot = 1.  
	
	Include the lackfit table and Receiver Operating Characteristic Curve output.  
	Output the predicted values to the dataset fulllogfluout. Write the code to produce a 3-D 
	probability perspective (surface) plot using Age on one axis with limits from 25 to 75 by 1 
	and HealthIns on the other axis from 0 to 2 by 0.25 and the ROC curve.  

	Paste the code here.

	Include the following output and analyze it
	1)  Global Output table.  Is the model statistically significant at the 95% CL.?
		 At 95% significance level the first two test have a very small chi-square,
		 but the last test Wald if very close to 0.05 its still below the rejection level, but it isnt
		 as strong as the other two test.
	
	2)  What is the null and alternative hypothesis for this test?  Interpret your p-value for the 
		chi-square test.
		
		Ho: The data fits the expected values.
		Ha: The data doesnt fit the expected values.
		
		The Hosmer and Lemeshow Goodness-of-Fit Test Chi-Square is 0.9191 therefore we fail to reject the 
		Null the data is a good fit for the model.
		
	3)  ROC curve.   Compare it to the ROC curve in part b.  Which model demonstrates higher 
		accuracy and why?
		
		The model from part b is not as accurate in comparison to the last model as this values have a 
		greater deviation and arent as consistance as the second model.
		
	4)  3-D graph. Interpret it as best as you can. You may need to rotate.  
		Be sure to use the edges as a guide to your analysis.
		
		In the 3D model we can see how as people get better health insurance and get older the flu shots 
		increase, althought the edges are important because it seems like at the extreme values the flu shots
		is always low or zero.

    d)  Adapt your code to perform a logistic regression on the flu shots including all the regressors
        (age, healthawareness, healthins) using the forward method. Paste the code here.

        PROC LOGISTIC DESCENDING;
        MODEL FluShot=age HealthAwareness HealthIns/ selection=forward ;
        OUTPUT OUT=fulllogfluout PREDICTED=full_flu;
        RUN;
        quit;
        
        1) What is the most important predictor of getting a flu shot?
        	
        	HealthIns
        
        2) What is the second most important predictor of getting a flu shot?
        
        	Age
*/