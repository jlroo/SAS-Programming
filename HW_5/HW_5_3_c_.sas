/*
 * ----ASSIGMENT_5---------
 * Author: Jose L Rodriguez
 * Assigment: 5
 * Problem: 3_c
 * Date: October 17th, 2014
 * SAS303 - FALL 2014
 * SAS 9.4 TS Level 1M1 
 * W32_7PRO platform
 */

DATA HAYNAS_DATA;
SET WORK.HAYNAS;
MASQ=MA**2;
PROC REG DATA=HAYNAS_DATA;
MODEL SEJ=MA MASQ;
TITLE "Quadratic Regression - Evolution of the skull structure of bone-cracking hypercarnivores(HAYNAS)";
RUN;
QUIT;

/*
 *	c)	Perform a quadratic regression. State the model (y = ax^2 + bx + c) and r-squared value.
 *			SEJ= 8.60935 - 73.35032*MA + 236.05951*MASQ  
 *		If we compare Residual vs Predicted in the firt and fifth graph, it looks like the values are evenly distributed around the line, 
 *		also there isnt a noticible pattern on graph five. From graph seven(Percent vs Recidual) we can infer that the model follows a 
 *		normal distribution. From graph one and two we can say that the model is Homoscedastic (Variance is constant) as the width/band 
 *		around data remains constant.
 */
