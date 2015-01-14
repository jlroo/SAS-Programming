DATA problem_1_2d_ii;
/*
----ASSIGMENT_1---------
Author: Jose L Rodriguez
Assigment: 1
Probleml:  1.2(d)_i
Date: September 4th, 2014
SAS303 - FALL 2014
----FILE INFO-----------
FILE: MilitaryService.txt
DATA ORDER: Last Name/First Name/Sex/Military Branch/Years of Service
------------------------
*/
infile "/folders/myfolders/SAS303/militaryservice.txt" dlm='/';
input LAST_NAME$ FIRST_NAME$ GENDER$ MILITARY_BRANCH$ YEARS_IN_SERVICE;*create input variables;
proc sort data=problem_1_2d_ii;
by MILITARY_BRANCH;*Sort the data by the military branch;
proc print data=problem_1_2d_ii;
where YEARS_IN_SERVICE >=5 and YEARS_IN_SERVICE<10;*select observations that meet the condition specified >=5 & <10;
title "Military Service List";
var LAST_NAME GENDER YEARS_IN_SERVICE;*Print the data with the last name , gender and years served;
ID MILITARY_BRANCH;*military branch as the identifier;
run;