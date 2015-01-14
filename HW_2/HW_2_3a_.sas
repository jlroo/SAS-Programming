
DATA ADOPTION;
/*
 * ----ASSIGMENT_2---------
 * Author: Jose L Rodriguez
 * Assigment: 2
 * Probleml:  3.1a
 * Date: September 18th, 2014
 * SAS303 - FALL 2014
 * SAS platform 'Linux LIN X64 2.6.32-431.11.2.el6.x86_64' 
 * SAS version '9.04.01M1P12042013' 
 *
 * Open and external file adoption.txt
 * 
 */ 
INFILE "/folders/myfolders/SAS303/HW_2/adoption.txt";
LENGTH COUNTRY$ 12;
INPUT COUNTRY$ YEAR NUM_OF_ADOPTIONS; *VARIABLES NAMES;
/*proc print data=ADOPTION; *print all the data from the external file;
title "TOTAL INTERNATIONAL ADOPTION FROM 2003 TO 2013";
run;*/
/*--Sort data by BY variable--*/
proc sort data=WORK.ADOPTION out=BAR_CHART;
    by COUNTRY;
run;

/*--Set output size--*/
ods graphics / reset width=6.4in height=4.8in imagemap;

/*--SGPLOT proc statement--*/
proc sgplot data=BAR_CHART noautolegend;
    /*--BY Variable--*/
    by COUNTRY;

    /*--Bar chart settings--*/
    vbar YEAR / response=NUM_OF_ADOPTIONS group=COUNTRY groupdisplay=Cluster 
        transparency=0.00 stat=Mean dataskin=None name='Bar';

    /*--Category Axis--*/
    xaxis;

    /*--Response Axis--*/
    yaxis grid label="&statRespLabel";

    /*--Legend Settings--*/
    keylegend 'Bar' / title='COUNTRY:' location=Outside;
run;