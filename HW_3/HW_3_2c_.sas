/*
 * ----ASSIGMENT_2---------
 * Author: Jose L Rodriguez
 * Assigment: 3
 * Probleml:  2c
 * Date: September 25th, 2014
 * SAS303 - FALL 2014
 * SAS platform 'Linux LIN X64 2.6.32-431.11.2.el6.x86_64' 
 * SAS version '9.04.01M1P12042013' 
 *
 * 
 * 
 */
/*--Set output size--*/
ods graphics / reset width=6.4in height=4.8in imagemap;

/*--SGPLOT proc statement--*/
proc sgplot data=WORK.URBAN_DEVELOP noautolegend;
    /*--TITLE and FOOTNOTE--*/
    title "Sales vs Square Feet";

    /*--Scatter plot settings--*/
    scatter x=SqF y=Sales / group=ZIPCODE markerattrs=(symbol=CircleFilled 
        size=15) transparency=0.4 name='Scatter';
    ;

    /*--X Axis--*/
    xaxis grid;

    /*--Y Axis--*/
    yaxis grid;

    /*--Legend Settings--*/
    keylegend 'Scatter' / title='ZIPCODE:' location=Outside;
run;

/*

Does there appear to be a trend in this? 
It seems like as the square footage increse sales increase, in the five different 
zipcodes. 
*/