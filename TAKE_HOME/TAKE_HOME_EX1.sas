/*
 * ----EXAM_2---------
 * Author: Jose L Rodriguez
 * Problem: 1
 * Date: November 14th, 2014
 * SAS303 - FALL 2014
 * SAS 9.4 TS Level 1M1 
 */
 
PROC FORMAT;
VALUE AGEft     4="4 WEEKS OLD"
                6="6 WEEKS OLD"
                8="8 WEEKS OLD"
                10="10 WEEKS OLD"
                12="12 WEEKS OLD";
RUN;

DATA PUMPKIN;
INFILE "C:\Users\jrodriguezorjuela\Desktop\PUMPKIN.txt" dlm=' ';
DO PUMPKIM=1 TO 24;
    DO AGE= 4 TO 12 by 2;
        AGESQ=AGE**2;
        AGECU=AGE**3;
        INPUT WEIGHT @@;
        OUTPUT;
    END;
END;
FORMAT AGE  AGEft.;
/*
PROC PRINT DATA=PUMPKIN NOOBS;
TITLE "PUMPKIN";
RUN;
*/

*SCATTER PLOT OF THE ORIGINAL DATA;
Ods Graphics On;

PROC GPLOT DATA=PUMPKIN;
PLOT WEIGHT*AGE;
TITLE "SCATTER PLOT OF  WEIGHT_VS_AGE OF PUMPKINS";

*LINEAR MODEL;
PROC REG DATA=PUMPKIN ;
MODEL WEIGHT=AGE;
PLOT WEIGHT*AGE;
OUTPUT OUT=PUMPKIN_LINEAR P=yhat;
TITLE "LINEAR REGRESSION FOR WEIGHT_VS_AGE OF PUMPKINS";
RUN;

*LINEAR MODEL OVER LAY;
SYMBOL1 VALUE=CIRCLE COLOR=BLUE;
SYMBOL2 VALUE=NONE COLOR=RED I=Join;
PROC GPLOT DATA=PUMPKIN_LINEAR;
PLOT WEIGHT*AGE=1 yhat*AGE=2 / OVERLAY;
TITLE "PLOT OF LINEAR MODEL OVER ORIGINAL DATA WEIGHT_VS_AGE OF PUMPKINS";
RUN;

*POLYNOMIAL MODEL;
PROC REG DATA=PUMPKIN  PLOTS=PREDICTIONS(X=AGE);
MODEL WEIGHT = AGE AGESQ AGECU;
TITLE "POLYNOMIAL MODEL FOR WEIGHT VS AGE OF PUMPKINS";
OUTPUT OUT=PUMPKIM_POLY P=yhat_poly;
RUN;

*POLYNOMIAL MODEL OVER LAY;
SYMBOL2 VALUE=CIRCLE COLOR=BLUE;
SYMBOL3 VALUE=NONE COLOR=RED I=Join;
PROC GPLOT DATA=PUMPKIM_POLY;
PLOT WEIGHT*AGE=2 yhat_poly*AGE=3 / OVERLAY;
TITLE "PLOT OF POLYNOMIAL MODEL OVER ORIGINAL DATA WEIGHT_VS_AGE OF PUMPKINS";
RUN;

Ods Graphics OFF; 

/*
 * c. Create a linear regression of weight vs age.
 *	
 * 	(i) State the model y= a+bt
 *
 *			Model: WEIGHT =  2.2393*AGE - 5.1725
 *
 * 	(ii) What is the coefficient of determination of the model and what does it mean?
 *
 *			The Coefficient of Determination or R-Square is 0.8184 meaning there is a relative high correlation the data.
 *
 *	(iii) Test the significance of a and b.
 * 
 *			The p-values t=-6.28 ,p=0.0001 and t=23.06 , p=0.0001 indicates that the AGE and intercept parameters estimates
 *			are highly significant. Given the F statistic of F-Value=531.95 P<0.0001 the overall model is highly significant
 *			the model explains a significant portion of the variation in the data.
 *
 *	(iv)  Analyze the model for independence, normality and constant variance of the residuals.State which plot of the 
 *			Diagnostic Fit plot you are analyzing for each and if the model meets or fails the residual assumption and why.
 *
 *			Independence:If we look at the residual_VS_predicted values plot, we can notice a downward parabola shape figure 
 *			indicating the residuals may not be independent and the collection of random variable is heteroscedasticity.
 *
 *			Normal:We can look at the Histogram of the prencet_VS_Residual is slightly left skewed. Also if we look at the 
 *			Residual_VS_Quantile plot the end points some of the points are below the line giving some push to the line 
 *			in the middle indicating an slight left skew.
 *			
 *			Constant Variance: Looking at the The Residual_VS_Predicted values plot we can see a pattern in the points, implying
 *			that there is a issue with the constant variance of the residual.
 *
 * d. Create an appropriate polynomial model for the weight vs age. Explain why you chose this form of the model.
 *		
 *		Looking at the initial scatter plot we see that the weight of the pumpkin increases as the 
 *		corresponding age increse until it level off and as we know pumpkins naturally dont have a linear 
 *		growth, therefore a linear model may not be the best choice here. This is not the only consideration 
 *		however since it intuitively we can tell that longer time in the soild may not yeald the hights weight 
 *		with more weeks in the ground at a certain point the weight of the pumpkin decrease. We can notice a parabolic 
 *		shape of the data, perhaps a qubic model would be a better choice. So, instead of simple linear regression here 
 *		it makes sense to consider polynomial regression.
 *
 * 	(i) State the model.
 *
 *			Model: WEIGHT = 5.2602(AGE) -0.1229(AGE)^2 -0.0051(AGE)^3 -16.8783
 *
 * (ii) What is the coefficient of determination of the model and what does it mean?  
 *		Is there a stronger relationship in this model than the linear model?
 *
 *			The Coefficient of Determination or R-Square is 0.8738 meaning there is a relative high
 *			correlation the data, this model has an stronger R-square compared to the linear model.
 *
 * (iii) Test the significance of your partial coefficients.  Be sure to state the test statistic and p-value 
 *		 of the test and include the output in your answer.
 *
 *			The overall F statistic is still significant F=267.76, P<0.0001). The R-square has increased from 0.8184 to 0.8738, 
 *			indicating that the model now accounts for 87.3% of the variation in Population. But the p-values are not significant 
 *			with p>0.05 for each parameter in the model we can infer that the parameter are close to zero, and the
 *			the p-value for the intercept is 0.0201<0.05 is signifcant. 		
 *
 * (iv)  Analyze the model for independence, normality and constant variance of the residuals.  
 *		 State which plot of the Diagnostic Fit plot you are analyzing for each and if the model 
 *		 meets or fails the residual assumption and why.
 *
 *			Independence:If we look at the residual_VS_predicted values plot the data is more scattered (spread out) 
 *			than in the linear model it is hard to notice a consistant pattern and the collection of random 
 *			variables is heteroscedastic.
 *
 *			Normal: We can look at the Histogram of the prencet_VS_Residual is slightly rigth skewed. But the Histogram is pretty close
 *			to be normal.
 *			
 *			Constant Variance: Looking at the The Residual_VS_Predicted values plot we can see a pattern in the points, implying
 *			that there is a issue with the constant variance of the residual as it seem to expand (deviate from zero) as AGE increase. 
 *
 *
 */

