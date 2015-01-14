DATA IN_CLASS_LOOPS;
INPUT YEARS;
DO i =1 TO 5; *If increment is 1, dont need by;
	Startyear=year+(i+1);
	endyear=year+i;
OUTPUT;*outputs the new calculation to dataset;
END;
DROP year i;*optional statement to drop this variable from memory;
datalines;
1980
1981
1982
1983
1984
1985
1986
1987
1988
1989
1990
;
