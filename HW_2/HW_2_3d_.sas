DATA SCATTER_ADOPTIONS;
/*
 * ----ASSIGMENT_2---------
 * Author: Jose L Rodriguez
 * Assigment: 2
 * Probleml:  3.d
 * Date: September 18th, 2014
 * SAS303 - FALL 2014
 * SAS platform 'Linux LIN X64 2.6.32-431.11.2.el6.x86_64' 
 * SAS version '9.04.01M1P12042013' 
 *
 * Set data path to work.adoption where the data is located.
 * choose just the countries that we want and sort the data by country\
 * and create a scatter plot.
 */ 
SET WORK.ADOPTION;
where country= "China" OR country="Russia" OR country ="Ethiopia" OR country ="Guatemala";

/*--Sort data by BY variable--*/

proc sort data=SCATTER_ADOPTIONS out=SCATTER_CHART;
    by COUNTRY;
run;

/*--Set output size--*/
ods graphics / reset width=6.4in height=4.8in imagemap;
symbol1 value = triangle color = red I = JOIN;
symbol2 value = square color = blue I = JOIN;
symbol3 value = circle color = green I = JOIN;
symbol4 value = circle color = green I = JOIN;

/*--SGPLOT proc statement--*/

proc gplot data=SCATTER_CHART noautolegend;
Title "ADOPTIONS PER YEAR BY COUNTRY";
plot NUM_OF_ADOPTIONS*YEAR=COUNTRY stat=Sum ;
run;
