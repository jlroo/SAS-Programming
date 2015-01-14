/*
 * ----ASSIGMENT_5---------
 * Author: Jose L Rodriguez
 * Assigment: 5
 * Problem: 3_d_e
 * Date: October 17th, 2014
 * SAS303 - FALL 2014
 * SAS 9.4 TS Level 1M1 
 * W32_7PRO platform
 */

DATA HAYNAS_NONLINEAR;
SET WORK.HAYNAS;
ODS GRAPHICS ON;

PROC Nlin PLOTS=DIAGNOSTICS(STATS=ALL);
PARAMETERS 	a=2 TO 8 BY 2 
			b=0.150 TO 0.275 BY 0.025;
MODEL SEJ = a*exp(b*MA);
RUN;
QUIT;
ODS GRAPHICS OFF;


/*
 *	d)	Perform an exponential regression using Proc Nlin.  
 *		Briefly, analyze the residual assumptions.  
 *		Include the parameters output and 9 panel residual analysis plot. 
 *		
 *		To find the starting values we can do a proc reg and use the parameters from
 *		the graph.
 *
 *		Model:   y = (0.7317) * e**((7.7684)*x)
 *		
 *
 *	e)  Of the quadratic model and the exponential model, which model has the best fit and why?  
 *		The model that that fits the best is the exponential model.
 *
 *
 */
