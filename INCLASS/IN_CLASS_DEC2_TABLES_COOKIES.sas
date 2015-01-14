
Data bday_party_food;
Input frequency sick $ punch $ cookies$;
Datalines;
35		yes		 yes	yes 
5 		yes		 yes    no 
2		yes		  no	yes
8		yes		  no	no
17 		no		 yes 	yes
3		no		 yes	no
8 		no		  no	yes
26 		no		  no	no
;
Proc Freq data = bday_party_food order = data;
*Table sick*punch / chisq cmh norow nocol expected;
*tables cookie*punch*sick / chisq cmh all;
Table punch*cookie*sick / chisq cmh all; *controling for punch getting sick given that got ill from cookies;
Weight frequency;
Run;
