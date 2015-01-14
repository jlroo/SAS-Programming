DATA PIE_CHART_ADOPTIONS;
/*
 * ----ASSIGMENT_2---------
 * Author: Jose L Rodriguez
 * Assigment: 2
 * Probleml:  3.1c
 * Date: September 18th, 2014
 * SAS303 - FALL 2014
 * SAS platform 'Linux LIN X64 2.6.32-431.11.2.el6.x86_64' 
 * SAS version '9.04.01M1P12042013' 
 * 
 * Create a pie chart for by country with the number of adoptions
 */

SET WORK.ADOPTION;
WHERE YEAR=2003 OR YEAR=2004 OR YEAR=2005 OR YEAR=2006 OR YEAR=2007 
	  OR YEAR=2008 OR YEAR=2009;
proc sort data=PIE_CHART_ADOPTIONS out=PIE_CHART;
    by COUNTRY;
run;

PROC MEANS DATA=PIE_CHART SUM;
%let start=90;
/*--Compute number of unique values for category variable--*/
proc sql ;
    create table _PieCount_ as select count(distinct(COUNTRY)) as catcount from 
        WORK.PIE_CHART;
quit;

/*--Read cat Count into macro variable--*/
data _null_;
    set _PieCount_ end=last;
    call symputx ("CatCount", catcount);
run;

/*--Macro for summarized data--*/
%macro summarizeMacro ();
    %if &CatCount gt 0 %then
        %do;

            /*--If NUM_OF_ADOPTIONS is assigned use proc means to find size of first slice--*/
            proc means data=WORK.PIE_CHART noprint;
                class COUNTRY / order=data;
                var NUM_OF_ADOPTIONS;
                output out=_PieMeans_ n=N sum=Sum;
            run;

            data _null_;
                set _PieMeans_(where=(_type_=1)) end=last;
                retain val1 val2 0;

                if _n_ eq 1 then
                    val1=Sum;
                else
                    val2=sum (val2, Sum);

                if last then
                    do;

                        if (val1+val2) > 0 then
                            do;
                                offset=int(180*val1/(val1+val2));
                                start=90 - offset;

                                if start < 0 then
                                    start=360+start;
                            end;
                        else
                            start=0;
                    end;
                call symputx ("start", start);
            run;

        %end;
%mend summarizeMacro;

%summarizeMacro ();

/*--Define Pie Template--*/
proc template ;
    define statgraph WebOne.Pie;
        begingraph;
        layout region;
        piechart category=COUNTRY response=NUM_OF_ADOPTIONS / dataskin=None 
            datatransparency=0.00 categorydirection=counterclockwise 
            start=&start
        datalabellocation=Auto datalabelattrs=(size=10);
        endlayout;
        endgraph;
    end;
run;

/*--Set output size--*/
ods graphics / reset width=4.8in height=4.8in imagemap tipmax=100000 
    antialiasmax=100000;

/*--SGRENDER proc statement--*/
proc sgrender data=WORK.PIE_CHART template=WebOne.Pie;
Title "NUMBER OF TOTAL ADOPTIONS BY COUNTRY";
run;
