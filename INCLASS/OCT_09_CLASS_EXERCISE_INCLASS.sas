DATA DJIA;
INPUT YEARS VALUE;
YEARSQ=YEARS**2;
YEARSCUB=YEARS**3;
DATALINES;
1913 1886
1923 1252
1929 4556
1933 1694
1943 1770
1953 2367
1963 5761
1973 4161
1983 2715
1993 5727
1999 14690
2003 12018
2007 14315
2008 9421
2013 16123
;
PROC REG DATA=DJIA PLOTS=PREDICTIONS(X=YEARS);
MODEL VALUE= YEARS YEARSQ; *linear model value(independent variable)=year(dependent); 
RUN;
/*
* parameter estimates
* intecept = -242272 tells me that in the year zero the value of djia was 242272
* LINEAR REGRESSION ISNT THE BEST FOR THIS TYPE OF DATA
* 
* (*) POLYNOMIAL REGRESSION
* 		PROC REG
*		 MODEL Y(DEPENDENT)=x xsq xcu;
*			Y= 8491118-8763.775(YEAR)+2.26176((YEAR)^2)
*  			We need to make sure that they are:
*				(1) INDEPENDET
*				(2)	NORMAL
*				(3) CONSTANT VARIABLE
*	To find independence we look at the first graph(we dont want any pattern)
*	fading out in the data look at graph (1)(2)
*	(3) LEVERAGE one point is really off (2008 year)
*	(0,2000)
*	(100,17000)
*/
