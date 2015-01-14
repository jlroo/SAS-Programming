
/*
 * ----ASSIGMENT_2---------
 * Author: Jose L Rodriguez
 * Assigment: 3
 * Probleml:  2a
 * Date: September 25th, 2014
 * SAS303 - FALL 2014
 * SAS platform 'Linux LIN X64 2.6.32-431.11.2.el6.x86_64' 
 * SAS version '9.04.01M1P12042013' 
 *
 * Open and external file URBANDEVELOPMENT.XLSX
 * 
 */
 
PROC FORMAT;
			/*Sell Item*/ 
Value AFT 		0="No"
				1="Yes";
Value BFT 	 	0="No"
				1="Yes";
Value CFT 	 	0="No"
				1="Yes";
Value DFT 		0="No"
				1="Yes";
Value EFT 		0="No"
				1="Yes";
Value FFT 		0="No"
				1="Yes";

Value GFT	  	/*restaurant services*/
				0= "No restaurant" 
				1 = "Carry out" 
				2 = "Dine In";

Value SICFT 	/*tax code type of store*/
				52 = "Hardware"
				53 = "General Merchandise"
				54 = "Grocery"
				56 = "Apparel"
				57 = "Furniture"
				59 = "Electronics";

RUN;

DATA URBAND;

PROC IMPORT OUT=URBAND DATAFILE= "/folders/myfolders/SAS303/HW_3/UrbanDevelopment.xls" 
	DBMS=XLS replace;
	SHEET="Sheet1";
    GETNAMES=yes;
FORMAT A AFT. B BFT. C CFT. D DFT. E EFT. F FFT. G GFT. SIC SICFT.;
PROC PRINT DATA=URBAND;
RUN;

