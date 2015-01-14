/*
 * ----ASSIGMENT_5---------
 * Author: Jose L Rodriguez
 * Assigment: 8
 * Problem: 1
 * Date: December 5th, 2014
 * SAS303 - FALL 2014
 * SAS 9.4 TS Level 1M1
 * W32_7PRO platform
 */
PROC IMPORT OUT=MULTI_REG 
        DATAFILE="/folders/myfolders/SAS303/HW_8/MultiRegressionBirthWeight.xlsx" 
        DBMS="xlsx" REPLACE;
    SHEET="Sheet1";
    GETNAMES=YES;
RUN;

DATA Birth_Weight;
    SET MULTI_REG;
    
	If _n_ = 16 then delete;
    
	IF Toxemia="Y" then
        Tox=1;
    ELSE
        Tox=0;
/*
PROC REG DATA=Birth_Weight  plots(label)=(RStudentByLeverage CooksD);
    MODEL BirthWeight=HeadCircumference Length GestationalAge MotherAge Tox/ VIF collin r 
	selection = stepwise;
    output cookd=cooksd;
    RUN;
quit;
*/

PROC REG DATA=Birth_Weight  plots(label)=(RStudentByLeverage CooksD);
    MODEL BirthWeight=HeadCircumference Length GestationalAge MotherAge Tox/ VIF collin r 
	selection = cp best=3;
    output cookd=cooksd;
    RUN;
quit;

/*
PROC G3GRID DATA=Birth_Weight  OUT=WEIGHT_3D;
GRID Length*GestationalAge=BirthWeight/
	AXIS1=32 TO 46 BY 1
	AXIS2=24 TO 33 BY 1;
RUN;

PROC G3D DATA=WEIGHT_3D;
PLOT Length*GestationalAge=BirthWeight/ROTATE=45 TILT=80;
RUN;
*/

/*
1. weight = head_c head_l g_age, m_age toxemia

a) 	What is the equation that predicts the weight?

	weight = - 3047.0619 - 0.37405(h) - 24.20375(m) - 141.40841(t) + 89.92833(l) + 56.15158(g) 	

	What does each of the partial slopes indicate?
	The partial slopes B1,B2,B3,B4 and B5 represents the expected change in the response of weight
	for a unit increase of each partial slope given that the rest keep constant. 

b) 	Does there appear to be any issue with multi-collinearity?  Explain.
	Yes, there is an issue with multi-collinearity on (5) and (6) both have small values and 
	condition index over 30.
	
c) 	There is an outlier in the data due to a miss-recorded piece of data. How can you tell?
   	What observation number is it?
	We can tell that it was miss-recorded if we compare the value with other values of the same
	variable also a birth weight so large is not possible, the observation number was at subject 16.

B)  Remove the outlier from the data. Run a stepwise multiple regression analysis on the data.
	Include the same information as in part a)

a)  Which variables did the stepwise method toss out?  Why did the model stop at step  it did
	and not toss any more variables out of the model?  State the statistical number that helped
	SAS make this conclusion.
	
	The stepwise method toss out head Circumference and Birth Weight. Because the model best model
	is bound to the condition numbers 1.9499, 24.382  and all the variables left in the model 
	are significant at the 0.1500 level, while no other variable met the 0.1500 significance 
	level, therefore they were not include in the model. Sas uses Mallow Cp statistic to determine
	when to add more variables, as C(p) approches 1 + (number of variables) then SAS stops.
	 
b)	Analyze your Cooks D output. What observation number seems to be contributing to the
	error of the model? Should we remove this data point from our analysis, why or why not?
	You might look at that data point.
	
	After removing the observation 16 the Cook's D output shows that observation 20 is contributing to
	the error of the model. We should not take out anyother observation as they are part of the sample
	in this case if we take out observation 20 as well there is going to be another observation that
	contributres to the error of the model.

c) 	Analyze the fit diagnostic output for the independence, normality and constant variance.
	Does the model seem to violate any of these or not? Explain.
	
	Diagnostic analysis: 
	Independence: It doesnt seem to be a big problem with in independence, maybe some values are 
	values concentrate in the middle but they are pretty much evenly distributed.
	Normality: From the prencent VS Raw Residual it looks like the residuals are somewhat normal.
	Constant Variance:From the residual VS Predicted Plot, the graph gets in a slightly upside down
	U shape from left to right. For bigger Y values (x approaching 0), the residuals are smaller.
	
	Overall the model doesnt seem to violate any of these diagnostics.

C)  Run a cp multiple regression analysis on the amended data (outlier from first part thrown out)
	(selection = cp) and include best =3 as another option. This will a list of the independent
	variables and the adj-r squared values for the top three models based on the Mallow C(p) statistic.

a) 	What are the top three models and the adj r-square value for each model?

	Number Model 	R-Square 	Variables in Model
		4  			0.8357 		Length GestationalAge MotherAge Tox
		5 			0.8358 		HeadCircumference Length GestationalAge MotherAge Tox
		3 			0.7843 		Length GestationalAge MotherAge

b)  Output your top model to a new data set and create a perspective plot of the model
	with birth weight plotted against length and gestational age.Choose a rotation and 
	tilt that give the plot a nice perspective and analyze the plot for max and min 
	values and trends. Logically, the longer baby and the baby with an older gestational 
	age should have the highest birth weight. 
	There is a parabolic shape for babies with a younger gestational age.  Why might that be?
	
	Because there is a minimun/average birth weight that dependents of the gestation age 
	for a new born to be healthy, and we can see from the graph how as the gestation age increase
	the new born lenght and weight increase as well.
	
*/