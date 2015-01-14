DATA problem_1_2c;
/*
----ASSIGMENT_1---------
Author: Jose L Rodriguez
Assigment: 1
Probleml:  1.2(c)
Date: September 4th, 2014
SAS303 - FALL 2014
----FILE INFO-----------
FILE: MilitaryService.txt
DATA ORDER: Last Name/First Name/Sex/Military Branch/Years of Service
------------------------
*/
infile "/folders/myfolders/SAS303/militaryservice.txt" dlm='/';
input LAST_NAME$ FIRST_NAME$ GENDER$ MILITARY_BRANCH$ YEARS_IN_SERVICE;
proc sort data=problem_1_2c;
by MILITARY_BRANCH;*Sort the data by the military branch;
proc print data=problem_1_2c;
title "Military Service List by Branch of Service";
var LAST_NAME GENDER YEARS_IN_SERVICE;*Print the data with the last name , gender and years served;
ID MILITARY_BRANCH;*military branch as the identifier;
by MILITARY_BRANCH;*print by military branch;
proc means;
var YEARS_IN_SERVICE;*Find the average number of years served for each military branch;
run;