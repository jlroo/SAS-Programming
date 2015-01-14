/*
 * ----ASSIGMENT_5---------
 * Author: Jose L Rodriguez
 * Assigment: 5
 * Problem: 2_c
 * Date: October 17th, 2014
 * SAS303 - FALL 2014
 * SAS 9.4 TS Level 1M1 
 * W32_7PRO platform
 */
DATA NATIONAL_LEAGUE_STATS;
SET WORK.BASEBALL;
PROC SORT OUT=NATIONAL_LEAGUE DATA=NATIONAL_LEAGUE_STATS;
BY LEAGUE;
RUN;
PROC CORR DATA=WORK.NATIONAL_LEAGUE;
LABEL 	W_L_ ="Winning Percentage" RUNS="Runs Scored" HR="Home Runs" SB="Team Stolen Base" 
		BAT_AVG="Team Battin Avg" OBP="On Base Percentage" ERA="Team Earned Run Avg" 
		WHIP="Walks + Hits per Inning Pitched";
BY LEAGUE;
VAR W_L_ RUNS HR SB BAT_AVG OBP ERA WHIP;
TITLE "STATS FOR 2013 BASEBALL SEASON BY LEAGUE";
RUN;

/*
 * d)  	Sort the data by league and create a correlation matrix.  Include the AL and NL correlation matrices. 
 *		Is there any difference in the correlations based on which league a team plays? If so, what is the difference?
 *		
 *		We can infer from the difference in the Simple statistics for league AL and NL that league did statistically better
 *		than league NL if we lookcloser to the correlation coefficient of Winning percentages and Runs Scored 
 *		for AL r= 0.79589 and for NL the correlation coeffienct r=0.71739. A noticiable difference in the correlation 
		coefficient for Stolen Bases in NL league is worth to mention, given that for this league there is a negative 
		correlation between the Stolen bases and the winning percentage meaning that stolening bases in games part of 
		the NL league didnt relay in stealing bases to win games (r=-0.33142). For AL league we have that the correlation 
		coefficient is r=0.09534 Not a large value but a factor that could help the winning percentage for AL.  
 */
