/*
 * ----ASSIGMENT_5---------
 * Author: Jose L Rodriguez
 * Assigment: 6
 * Problem: 1
 * Date: October 26th, 2014
 * SAS303 - FALL 2014
 * SAS 9.4 TS Level 1M1 
 * W32_7PRO platform
 */
PROC IMPORT OUT=RESPONSE_DATA DATAFILE="C:\Users\jrodriguezorjuela\Desktop\Response.xlsx"
			DBMS="EXCEL" REPLACE;
			SHEET="Sheet1";
			GETNAMES=YES;
RUN;

DATA NonLin_Response;
SET WORK.RESPONSE_DATA;
ODS GRAPHICS ON;

PROC SGPLOT DATA=NonLin_Response;
TITLE "Scatter plot for Response Data";
SCATTER X=X Y=Y;
RUN;

PROC NLIN PLOTS=DIAGNOSTICS(STATS=ALL);
PARAMETERS 	a=80
			b=-0.5;
MODEL y=a*exp(b*x);
TITLE "NonLinear Regression Model [y = ae^(bx)] for Response Data";
RUN;

PROC NLIN PLOTS=DIAGNOSTICS(STATS=ALL);
PARAMETERS 	a=0.1
			b=0.1
			c=0.1;
MODEL y = exp(a*x)/(b+c*x);
TITLE "NonLinear Regression Model [y = e^(ax)/(b + cx)] for Response Data";
RUN;

ODS GRAPHICS OFF;
QUIT;

/* 		Residual sum of squares (RSS) is the sum of squares of residuals. 
		(SSR) or the sum of squared errors of prediction (SSE). It is a measure of the discrepancy between the data 
		and an estimation model. A small RSS indicates a tight fit of the model to the data.

 *	c) 	What is the sum of the squares when convergence is met? 
  *		Analyze the residual assumptions. Explain how you decide on the parameters for a and b.
 *		The parameters were determine by looking at the local minimals and the scatter plot graph.
 *		When we analyze residuals we are looking for:
 * 			Sum of Squares = 89484.3
 *		(1) Independence (NOT_pattern)
 *			-> 	From the residual plot it doesnt look like there is a pattern but the projected residual could get
 *				closer to the real value to have a better model.
 *		(2)	Normality of the error distribution.
 *			-> From the graph we can see that the model keeps normality and its slightly negative skewed.
 *		(3)	Constant Variable of erros (Homoscedastic)
 *			-> From graph number three we can infer that the model is Homoscedatic.
 *	
 *	d) 	Uing Proc Nlin create a nonlinear regression of the form y = e^(ax)/(b + cx). Analyze the residual assumptions.
 *		What is the sum of the squares when convergence is met and is it better or worse than the model in part c?
 *			Sums of Squares= 89982.5 For this model the residuals he residuals appear to behave randomly, 
 *			suggesting that the model fits the data well. Although thw SSE is larger than the fisrt model therefore 
 *			the first model is better.
 *		
 *
 *
 */
