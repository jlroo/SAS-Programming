DATA CHIWEATHER;
/*
 * ----ASSIGMENT_2---------
 * Author: Jose L Rodriguez
 * Assigment: 2
 * Probleml:  2.2a
 * Date: September 18th, 2014
 * SAS303 - FALL 2014
 * SAS platform 'Linux LIN X64 2.6.32-431.11.2.el6.x86_64' 
 * SAS version '9.04.01M1P12042013' 
 *
 */
PROC IMPORT OUT=WORK.WEATHER DATAFILE="/folders/myfolders/SAS303/HW_2/Weather.xls" DBMS=xls replace;
	Sheet="Sheet 1";
    Getnames=yes;
RUN;
PROC MEANS DATA=WORK.WEATHER MEAN STD VAR CLM;
VAR MaxTemperatureF MeanTemperatureF MinTemperatureF;
TITLE "MAX, MEAN AND MIN TEMPERATURE FOR CHICAGO";
RUN;

/*
Why do you think the standard deviation (or variance) is so big for all three and in
particular for the average high temperature?

tandard deviation (SD) (represented by the Greek letter sigma, 
σ) measures the amount of variation or dispersion from the average.[1] 
a high standard deviation indicates that the data points are 
spread out over a large range of values. In this case the difference between the
high temperatures in the city of Chicago are large therefore we get a large STD.


*/
