/*
 * ----ASSIGMENT_5---------
 * Author: Jose L Rodriguez
 * Assigment: 5
 * Problem: 2_a_b
 * Date: October 17th, 2014
 * SAS303 - FALL 2014
 * SAS 9.4 TS Level 1M1 
 * W32_7PRO platform
 */

PROC IMPORT OUT=BASEBALL DATAFILE="C:\Users\jrodriguezorjuela\Desktop\BaseballStats2013.xlsx"
			DBMS= "EXCEL" REPLACE; 
			SHEET="leagues_MLB_2013_teams_standard";
			GETNAMES=YES;
RUN;

DATA BASEBALL_STATS;
SET WORK.BASEBALL;
PROC CORR DATA=BASEBALL_STATS;
LABEL 	W_L_ ="Winning Percentage" RUNS="Runs Scored" HR="Home Runs" SB="Team Stolen Base" 
		BAT_AVG="Team Battin Avg" OBP="On Base Percentage" ERA="Team Earned Run Avg" 
		WHIP="Walks + Hits per Inning Pitched";
VAR W_L_ RUNS HR SB BAT_AVG OBP ERA WHIP;
TITLE "2013 SEASON BASEBALL NATIONAL LEAGUE STATS";
RUN;

/*
 **** CORRELATION COEFFICIENT ****
 *	  r = 0, no correlation		 *
 *	  r > 0 positive			 *
 *	  r < 0 negative			 *
 *********************************
 * c) Analyze your output. 
 *
 * ------------|	W_L_	|RUNS	  |	HR		 |	SB		 |	BAT_AVG	 |	OBP		 |	ERA		 |	WHIP	  |
 *   W_L_	   |------------|---------|----------|-----------|-----------|-----------|-----------|------------|
 *   Winning % |	1.00000 |0.71781  |	0.28175	 |	-0.06202 |	0.58325	 |	0.75713	 |	-0.74805 |	-0.73650  |	<Correlation Coefficient>
 * ------------|			|<.0001   |	0.1315	 |	0.7448	 |	0.0007	 |	<.0001	 |	<.0001	 |	<.0001	  |	<significance level> 
 *
 *
 * (i) Which variable has the strongest positive correlation (state the value) to winning percentage and what does this mean? 
 *
 *	From the Correlation table we can see the vairables that has the strongest positive correlation are OBS(On base percentage) 
 *	r=0.75713, OBS measures of how often a batter reaches base for any reason other than a fielding error; The second variable with
 *	an strong positive correlation is RUNS(Runs scored)with a Correlation Coeffient of r=0.71781; following by AT_AVG(Team Battin Avg)
 *	with a correlation of r=0.58325 and RUNS(Runs Scored) with a correlation of r=0.28175. The last two variables have a less stronger
 *	correlation but are still in the positive side so cant discard them.
 *
 * (ii)Which variable has the strongest negative correlation (state the value)  to winning percentage and what does this mean?
 *	
 *	From the Correlation table we can see the vairables that has the strongest negative correlation are ERA(Team Earned Run Avg) 
 *	r=-0.74805, ERA is the mean of earned runs given up by a pitcher per nine innings pitched. The second variable with
 *	an strong negative correlation is WHIP(Walks + Hits per Inning Pitched) with a Correlation Coeffient of r=-0.73650, follow by SB(Team Stolen Base)
 *	with a correlation of r=-0.06202, significantly smaller thant the other ones but its still a negative correlation.
 *
 * (iii)  What variable has the strongest overall correlation to winning percentage?
 *	
 *	From the Correlation table we can see that the variable with the strongest overall correlation to the winning percentage is OBS (on base percentage)
 *	with a correlation coeffienct of r=0.75713.
 * d)  	Sort the data by league and create a correlation matrix.  Include the AL and NL correlation matrices. 
 *		Is there any difference in the correlations based on which league a team plays? If so, what is the difference?
 */
