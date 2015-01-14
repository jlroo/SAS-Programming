/*
 * ----ASSIGMENT_5---------
 * Author: Jose L Rodriguez
 * Assigment: 5
 * Problem: 3_a_b
 * Date: October 17th, 2014
 * SAS303 - FALL 2014
 * SAS 9.4 TS Level 1M1 
 * W32_7PRO platform
 */

PROC IMPORT OUT=HAYNAS DATAFILE="C:\Users\jrodriguezorjuela\Desktop\Bone Cracking Hypercarnivores Data.xlsx"
			DBMS= "EXCEL" REPLACE;
			SHEET="SHEET1";
			GETNAMES=YES;
RUN;

DATA HAYNAS_DATA_LINEAR;
SET WORK.HAYNAS;
PROC REG DATA=HAYNAS_DATA_LINEAR;
MODEL SEJ=MA;
PLOT SEJ*MA/PRED;
TITLE "Linear Regression - Evolution of the skull structure of bone-cracking hypercarnivores(HAYNAS)";
RUN;
QUIT;

/*
 *	3.  Evolution of the skull structure of bone-cracking hypercarnivores(HAYNAS)
 *				   RATIO OF SKULL
 *			(DL)	DEPTH/LENGTH
 *			(WL)	WIDTH/LENGTH
 *
 *			mechanical advantage (MA) – how hard the bite is relative to the energy exerted to create the bite, 
 *			strain energy (SEJ)- energy of deforming the skull/mandible as it crushes its prey (in jules).   
 *
 *			OPTIMIZED SHAPE (PROPERTIES OF THE STRUCTURE)
 *				(1)	MECHANICAL ADVANTAGES 	(MA)
 *				(2)	STRAIN ENERGY in JULES	(SEJ)
 *
 *	a)	Perform a linear regression of SEJ vs, MA. Write out the model (SEJ  = m*MA + b)
 *			SEJ= 31.81161*MA -2.76054 
 *
 *	b) 	Analyze the r-square value and the output from the 9 panel data. Why is a linear regression model not the best model?  
 *		Include the parameters output and 9 panel residual analysis plot.
 *
 *		R-square = 0.7557 ( Coefficient of Determination), measures the strength of correlation between the two variables.
 *		The higher the R-squared, the better the model fits our data. However, R-squared cannot determine whether the coefficient 
 *		estimates and predictions are biased. R-squared does not indicate whether a regression model is adequate. We can have 
 *		a low R-squared value for a good model, or a high R-squared value for a model that does not fit the data.
 */
