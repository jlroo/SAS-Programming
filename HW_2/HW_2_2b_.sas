DATA WINTER;
/*
 * ----ASSIGMENT_2---------
 * Author: Jose L Rodriguez
 * Assigment: 2
 * Probleml:  2.2b
 * Date: September 18th, 2014
 * SAS303 - FALL 2014
 * SAS platform 'Linux LIN X64 2.6.32-431.11.2.el6.x86_64' 
 * SAS version '9.04.01M1P12042013' 
 *
 */
 
SET WORK.WEATHER;
WHERE MONTH = "DEC" OR MONTH="JAN" OR MONTH="FEB";
PROC SORT DATA=WINTER;
BY MONTH;
PROC MEANS DATA=WINTER MEAN STD CLM;
VAR MeanTemperatureF;
TITLE "CHICAGO WINTER";
RUN;

/** 
   Why is the standard deviation smaller on the winter months than the entire year?
	As we know the STD measures the amount of variation or dispersion from the average. 
	a low standard deviation indicates that the data points tend to be very 
	close to the mean or expected value. Meaning that during the winter months the 
	climate has a more stady temperatures withour much variation.
**/
