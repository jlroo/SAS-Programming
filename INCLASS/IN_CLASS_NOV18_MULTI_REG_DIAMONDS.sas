PROC IMPORT OUT=diamonds_multi_reg DATAFILE="C:\Users\jrodriguezorjuela\Desktop\Diamonds.xls"
			DBMS="excel" REPLACE;
			SHEET="Sheet1";
			GETNAMES=YES;
RUN;

Data diamonds_W;
set work.diamonds_multi_reg;
	 if color = "D" then colornumber = 1;
else if color = "E" then colornumber = 2;
else if color = "F" then colornumber = 3;
else if color = "G" then colornumber = 4;
else if color = "H" then colornumber = 5;
else if color = "I" then colornumber = 6;
else if color = "J" then colornumber = 7;

	 if clarity = "FL"   then claritynumber = 1;
else if clarity = "IF"   then claritynumber = 2;
else if clarity = "VVS1" then claritynumber = 3;
else if clarity = "VVS2" then claritynumber = 4;
else if clarity = "VS1"  then claritynumber = 5;
else if clarity = "VS2"  then claritynumber = 6;
else if clarity = "SI1"  then claritynumber = 7;
else if clarity = "SI2"  then claritynumber = 8;

	 if cut = "EXCELLENT" then cutnumber = 1;
else if cut = "VERY GOOD" then cutnumber = 2;
else if cut = "GOOD" 	 then cutnumber = 3;
run;

PROC REG DATA=diamonds_W; 
MODEL PRICE = Carat cutnumber colornumber claritynumber / VIF influence selection = forward r cli clm;
output out=predprice(where(cooksd<1)) p=pprice cookd=cooksd;
RUN;

/*
Clarity
Cut
colornumber
cutnumber
3)	Write the code to perform a multiple regression, include the vif,r, cli and clm.  
a)	Based on the output, would you include all parameters in your model? 
	If not, which one(s) would you exclude? 
	Does there appear to be any multi-collinearity issues?
4)	Run the code again using the selection = Forward option. 
a.	How many iterations are there?
b.	What variables does it leave out in the final iteration? What is the regression model of this last iteration?
c.	How well does the last iteration predict the price of a diamond as a function of the regressors?  (Look at the adjusted coefficient of determination or r-squared).  What does this mean?
5)	Do a multiple regression using the backward selection.  Do you get a different model?
6)	Create a 3 d plot surface plot of the price vs carat vs color and a 3d plot surface plot of price vs carat vs clarity.
7)	Look at the Cook’s D table. Which are the top three observations that have the greatest influence on the model?  Remove those three observations from the data (either amend the excel file or change your data) and run the Forward option again.  Does this change your parameters of your model significantly?

*/
