DATA CAR_BRANDS;
INFILE "C:\Users\jrodriguezorjuela\Desktop\CarBrands.txt" dlm=' ';
LENGTH BRAND1 - BRAND4$ 12;
INPUT SUBJECT$ BRAND1 - BRAND4;
PROC PRINT DATA=CAR_BRANDS noobs;
RUN;

DATA restructure;
set WORK.CAR_BRANDS;
ARRAY BRAND[4]BRAND1 - BRAND4;
DO i=1 TO 4;
	BRAND_TYPE=BRAND[i];
	IF BRAND_TYPE ne "XX" THEN OUTPUT;
END;
DROP i BRAND1 - BRAND4;
proc print data=restructure;
TITLE "CAR SURVEY NUMBER OF CARS PER HOUSEHOLD BY BRAND";
run;
PROC FREQ data=restructure ORDER=FREQ;
TABLES BRAND_TYPE /NOROW NOCOL NOFREQ NOCUM; 
RUN;

/*
1.	The file CarBrands.txt is a spaced delimited file that contains data from a survey on the 
	number of cars_household 
	brand.  
	subject number 
	BRANDS= 1 to 4 names for the brand of vehicle.
 	for subject if brands < 4
	placeholder = XX
	
a.	Use the infile command to read the data. 
b.	Include the command to output the entire name of the brand (not a truncated name).
c.	Create a new dataset named restructure. 
d.	Use an array and do loop to restructure the data so that the data is in the format of 

Subject	Brand
	1	Chevrolet
	1	Nissan
	2	Ford
 		.
		.
		.

e.	Using the ProcFreq command
f.	Print a table of the brands in descending order (order = freq ).
g.	Include the table in your write up. The percent of Americans that own each car is 
		Chevrolet- 12%
		Dodge – 8%
		Ford – 16%
		GMC – 4%
		Honda – 22%
		Hyundai – 4%
		Kia – 9%
		Nissan- 2%
		Toyota – 23%

h.	Test whether your sample matches the distribution of car brands owned by Americans at a 95% confidence level. 
i.	State the test you will use, the null hypothesis and alternative hypothesis.  
j.	State your conclusion and explain how you arrived at your conclusion. (Include the appropriate SAS output to support your conclusion.)
k.	Which brand is the most over-represented in the sample as compared to the population percent? 
l.	Which brand is most under-represented?  (Include the output that demonstrates this.)
m.	Which brand is contributing the most value to the Chi-Square value? 
*/
