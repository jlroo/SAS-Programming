DATA PISTON;
INPUT COMPRESSOR$ LOCATION$ TOTAL;
DATALINES;
1	NORTH	17
1	CENTER	17
1	SOUTH	12
2	NORTH	11
2	CENTER	9
2	SOUTH	13
3	NORTH	11
3	CENTER	8
3	SOUTH	19
4	NORTH	14
4	CENTER	7
4	SOUTH	28
;
PROC FREQ DATA=PISTON ORDER=DATA;
TABLES COMPRESSOR*LOCATION/CHISQ DEVIATION EXPECTED CELLCHI2 CROSSLIST(STDRES);
WEIGHT TOTAL;
RUN;
PROC GCHART DATA=PISTON;
VBAR TOTAL;
BY LOCATION;
RUN;
PROC GCHART DATA=PISTON;
VBAR TOTAL;
BY COMPRESSOR;
RUN;
PROC GCHART DATA=PISTON;
VBAR TOTAL;
BY COMPRESSOR;
RUN;

/*
*************TABLE***************
Compressor	North	Center	South
	1		17		17		12
	2		11		9		13
	3		11		8		19
	4		14		7		28
***********************************

Which compressors have large deviations in magnitude?  What might this suggest?  
	Create a vertical bar chart of the number of piston rings that failed for each compressor grouped by the location.

*/
