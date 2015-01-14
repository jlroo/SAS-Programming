DATA Problem_1_2_d_iii;

/*
----ASSIGMENT_1---------
Author: Jose L Rodriguez
Assigment: 1
Probleml:  1.2(d)_iii
Date: September 4th, 2014
SAS303 - FALL 2014
---- SET FILE INFO-----------
FILE: problem_1_2c.sas
DATA ORDER: LAST_NAME GENDER YEARS_IN_SERVICE
------------------------
*/
set PROBLEM_1_2C;*read rows and columns from problem_1_2C table;
if MILITARY_BRANCH="Marines";*Only those rows whose value of MILITARY_BRANCH is Marines are output to the new table ;
proc print;
TITLE "MILITARY SERVICE MARINES LIST";
run;