DATA program_1_2a;
/*
----ASSIGMENT_1---------
Author: Jose L Rodriguez
Assigment: 1
Probleml:  1.2(a)
Date: September 4th, 2014
SAS303 - FALL 2014
----FILE INFO-----------
FILE: MilitaryService.txt
DATA ORDER: Last Name/First Name/Sex/Military Branch/Years of Service
------------------------
*/
infile "/folders/myfolders/SAS303/militaryservice.txt" dlm='/';*Open and external file militaryservice.txt;
input LAST_NAME$ FIRST_NAME$ GENDER$ MILITARY_BRANCH$ YEARS_IN_SERVICE;*input variables;
proc print;*print all the data from the external file;
title "Military Service List";
run;