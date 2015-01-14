/*
 * ----ASSIGMENT_4---------
 * Author: Jose L Rodriguez
 * Assigment: 4
 * Probleml:  4
 * Date: October 2nd, 2014
 * SAS303 - FALL 2014
 * SAS platform 'Linux LIN X64 2.6.32-431.11.2.el6.x86_64' 
 * SAS version '9.04.01M1P12042013' 
 *
 *
 *	Line 1	: Data Mistake;
 *	Line 2	: input ID Lname $ Fname $ Age Marital-Status(1);
 *	Line 3	: Datalines(2)
 *	Line 4	: A345(4) Johnson Tim 32 M;(3)
 *	Line 5	: B879 Smith James 27 D;
 *			  (other data)
 * 			  ; 			*semicolon to end datalines no mistakes here;
 *	Line 7 	: Proc Print Data= "Mistake"(5) noobs;
 * 	Line 8	: var ID, Lname, fname, age;(6)
 *	Line 9	: run;
 *	Line 10	: Proc Mean(7) data = mistake (8)mean std median;
 *	Line 11	: var ID age;
 *	Line 12	: run;

 * (1)ERROR: Missing numeric suffix on a numbered variable list (Marital-Status).      
                                                                                                                                                               
 * (2)ERROR 180-322: Statement is not valid  expecting one of the following: ;

 * (3)ERROR 22-322: Syntax error, ";" no expected.

 * (4)ERROR 180-322: Statement is not valid ID variable is numeric and the data is character type

 * (5)ERROR: File Mistake does not exist. data="Mistake" is in quotes, statement no valid.

 * (6)ERROR 22-322: Syntax error, expecting one of the following. (No need for ",")

 * (7)ERROR: Procedure MEAN not found. (MEAN is not a SAS procedure)

 * (8)ERROR: mean std median are part of the options for the command TABLES 
		  	 no a procedure.

*/
