DATA inclass;
proc Import out=work.testfile datafile="/folders/myfolders/SAS303/dataexample.xls" DBMS=xls replace;
sheet="Data";
Getnames=yes;
proc print;
title "import Excel";
run;