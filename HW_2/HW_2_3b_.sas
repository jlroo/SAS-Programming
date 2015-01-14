DATA ADOPTIONS_PER_YEAR;
/*
 * ----ASSIGMENT_2---------
 * Author: Jose L Rodriguez
 * Assigment: 2
 * Probleml:  3.1b
 * Date: September 18th, 2014
 * SAS303 - FALL 2014
 * SAS platform 'Linux LIN X64 2.6.32-431.11.2.el6.x86_64' 
 * SAS version '9.04.01M1P12042013' 
 *
 * Get file to create vertical Bar charts 
 * Vertical chart for number of adoptions per year by country
 */ 
 
SET WORK.ADOPTION;
/*--Sort data by BY variable--*/
proc sort data=ADOPTIONS_PER_YEAR out=VAR_CHART;
    by COUNTRY;
run;

/*--Set output size--*/
ods graphics / reset width=7.5in height=4.5in imagemap;

/*--SGPLOT proc statement--*/
proc sgplot data=VAR_CHART noautolegend;
Title "NUMBER OF ADOPTIONS PER YEAR BY COUNTRY";
    /*--Bar chart settings--*/
    vbar COUNTRY / response=NUM_OF_ADOPTIONS group=YEAR groupdisplay=Cluster 
        transparency=0.00 stat=Sum dataskin=None name='Bar';

    /*--Category Axis--*/
    xaxis display=(nolabel) discreteorder=data;

    /*--Response Axis--*/
    yaxis grid label="Number of Adoptions";

    /*--Legend Settings--*/
    keylegend 'Bar' / title='YEAR:' location=Outside;
run;