PROC IMPORT OUT=STOCKS_DATA DATAFILE="/folders/myfolders/SAS303/Research_Project/STOCKS_SANDY_OCT_DEC.xlsx" 
DBMS="xlsx" REPLACE; 
SHEET="SAS"; 
GETNAMES=YES; 
RUN;
/*
*Define the CORRPVAL macro;
%inc "/folders/myfolders/SAS303/corrpval.sas";   
%corrpval(DATA=STOCKS_SANDY, corr=corr_close, out=ccorr);
*Stream a CSV representation of SASHELP.CARS directly to the user's browser.;
proc export data=ccorr
            outfile=_dataout
            dbms=csv replace;
run;
%let _DATAOUT_MIME_TYPE=text/csv;
%let _DATAOUT_NAME=close_cor.csv;
*/

PROC FORMAT; 
VALUE $STOCKS	JNJ_CLOSE 	='Johnson & Johnson (NYSE:JNJ)' 
				HON_CLOSE 	='Honeywell International, Inc.(NYSE: HON)' 
				NRG_CLOSE 	='NRG Energy, Inc. (NYSE: NRG)' 
				CAR_CLOSE 	='Avis Budget Group, Inc.(NASDAQ: CAR)' 
				MRK_CLOSE 	='Merck & Co., Inc.(NYSE: MRK)'  
				CPB_CLOSE 	='Campbell Soup Company (NYSE: CPB)'
				PRU_CLOSE 	='Prudential Financial, Inc.(NYSE: PRU)'
				CB_CLOSE 	='Chubb Corporation (NYSE: CB)' 
				BBBY_CLOSE ='Bed Bath & Beyond Inc.(NASDAQ: BBBY)'
				ADP_CLOSE 	='Automatic Data Processing, Inc. (NASDAQ: ADP)' 
				CELG_CLOSE ='Celgene Corp. (NASDAQ: CELG)' 
				DGX_CLOSE 	='Quest Diagnostics Inc. (NYSE: DGX)' 
				SEE_CLOSE 	='Sealed Air Corp. (NYSE: SEE)' 
				HTZ_CLOSE 	='Hertz Global Holdings, Inc. (NYSE: HTZ)' 
				PEG_CLOSE 	='Public Service Enterprise Group Inc. (NYSE: PEG)' 
				CTSH_CLOSE ='Cognizant Technology Solns Corp. (NASDAQ: CTSH)' 
				BDX_CLOSE 	='Becton, Dickinson and Co. (NYSE: BDX)' ;
RUN; 

DATA STOCKS_SANDY; 
LENGTH HURRICANE_TIME_LINE$ 25 ; 
SET WORK.STOCKS_DATA;

	 IF DATE  < '20OCT2012'd THEN HURRICANE_TIME_LINE="BEFORE_SANDY"; 
ELSE IF DATE <= '09NOV2012'd THEN HURRICANE_TIME_LINE="DURING_SANDY";  
ELSE IF DATE <= '30NOV2012'd THEN HURRICANE_TIME_LINE="AFTER_SANDY"; 
ELSE IF DATE <= '31DEC2012'd THEN HURRICANE_TIME_LINE="MONTH_AFTER_SANDY";  

PROC SORT DATA=STOCKS_SANDY; 
BY DATE; 
RUN;
/*
PROC PRINT DATA=STOCKS_SANDY; RUN;
*/
ODS graphics on;
/*
proc iml;
use work.STOCKS_DATA var{	JNJ_CLOSE HON_CLOSE NRG_CLOSE 
							CAR_CLOSE MRK_CLOSE CPB_CLOSE 
							PRU_CLOSE CB_CLOSE BBBY_CLOSE 
							ADP_CLOSE CELG_CLOSE DGX_CLOSE 
							SEE_CLOSE HTZ_CLOSE PEG_CLOSE 
							CTSH_CLOSE BDX_CLOSE
						};
read all var _NUM_ into Y[c=varNames];
corr = corr(Y);
call HeatmapCont(corr)
     xvalues=varNames yvalues=varNames
     colorramp="ThreeColor" range={-1 1}
     title="CORRELATION ANALYSIS BETWEEN STOCKS PRICES";
close work.STOCKS_DATA;

PROC CORR DATA=STOCKS_SANDY outp=corr_close nosimple;
LABEL 	JNJ_CLOSE 	='Johnson & Johnson (NYSE:JNJ)' 
		HON_CLOSE 	='Honeywell International, Inc.(NYSE: HON)' 
		NRG_CLOSE 	='NRG Energy, Inc. (NYSE: NRG)' 
		CAR_CLOSE 	='Avis Budget Group, Inc.(NASDAQ: CAR)' 
		MRK_CLOSE 	='Merck & Co., Inc.(NYSE: MRK)'  
		CPB_CLOSE 	='Campbell Soup Company (NYSE: CPB)'
		PRU_CLOSE 	='Prudential Financial, Inc.(NYSE: PRU)'
		CB_CLOSE 	='Chubb Corporation (NYSE: CB)' 
		BBBY_CLOSE ='Bed Bath & Beyond Inc.(NASDAQ: BBBY)'
		ADP_CLOSE 	='Automatic Data Processing, Inc. (NASDAQ: ADP)' 
		CELG_CLOSE ='Celgene Corp. (NASDAQ: CELG)' 
		DGX_CLOSE 	='Quest Diagnostics Inc. (NYSE: DGX)' 
		SEE_CLOSE 	='Sealed Air Corp. (NYSE: SEE)' 
		HTZ_CLOSE 	='Hertz Global Holdings, Inc. (NYSE: HTZ)' 
		PEG_CLOSE 	='Public Service Enterprise Group Inc. (NYSE: PEG)' 
		CTSH_CLOSE ='Cognizant Technology Solns Corp. (NASDAQ: CTSH)' 
		BDX_CLOSE 	='Becton, Dickinson and Co. (NYSE: BDX)' ;
		
VAR JNJ_CLOSE HON_CLOSE NRG_CLOSE 
	CAR_CLOSE MRK_CLOSE CPB_CLOSE 
	PRU_CLOSE CB_CLOSE BBBY_CLOSE
	ADP_CLOSE CELG_CLOSE DGX_CLOSE
	SEE_CLOSE HTZ_CLOSE PEG_CLOSE 
	CTSH_CLOSE BDX_CLOSE;  
TITLE "CORRELATION ANALYSIS OF STOCK PRICES DURING HURRICANE SANDY"; 
RUN;
/*
%inc "/folders/myfolders/SAS303/corrpval.sas";   
%corrpval(DATA=STOCKS_SANDY, corr=corr_close, out=ccorr);
*Stream a CSV representation of SASHELP.CARS directly to the user's browser.;
proc export data=ccorr
            outfile=_dataout
            dbms=csv replace;
run;
%let _DATAOUT_MIME_TYPE=text/csv;
%let _DATAOUT_NAME=close_cor.csv;
*/
/*
proc iml;
use work.STOCKS_DATA var{	JNJ_VOLUME HON_VOLUME NRG_VOLUME 
							CAR_VOLUME MRK_VOLUME CPB_VOLUME 
							PRU_VOLUME CB_VOLUME BBBY_VOLUME 
							ADP_VOLUME CELG_VOLUME DGX_VOLUME 
							SEE_VOLUME HTZ_VOLUME PEG_VOLUME 
							CTSH_VOLUME BDX_VOLUME
						};
read all var _NUM_ into Y[c=varNames];
corr = corr(Y);
call HeatmapCont(corr)
     xvalues=varNames yvalues=varNames
     colorramp="ThreeColor" range={-1 1}
     title="CORRELATION ANALYSIS BETWEEN CHANGE IN VOLUME OF STOCKS TRADED";
close work.STOCKS_DATA;

PROC CORR DATA=STOCKS_SANDY outp=corr_vol nosimple; 
LABEL 	JNJ_VOLUME  ='Johnson & Johnson (NYSE:JNJ)' 
		HON_VOLUME 	='Honeywell International, Inc.(NYSE: HON)' 
		NRG_VOLUME 	='NRG Energy, Inc. (NYSE: NRG)' 
		CAR_VOLUME 	='Avis Budget Group, Inc.(NASDAQ: CAR)' 
		MRK_VOLUME 	='Merck & Co., Inc.(NYSE: MRK)'  
		CPB_VOLUME 	='Campbell Soup Company (NYSE: CPB)'
		PRU_VOLUME 	='Prudential Financial, Inc.(NYSE: PRU)'
		CB_VOLUME 	='Chubb Corporation (NYSE: CB)' 
		BBBY_VOLUME ='Bed Bath & Beyond Inc.(NASDAQ: BBBY)'
		ADP_VOLUME 	='Automatic Data Processing, Inc. (NASDAQ: ADP)' 
		CELG_VOLUME ='Celgene Corp. (NASDAQ: CELG)' 
		DGX_VOLUME 	='Quest Diagnostics Inc. (NYSE: DGX)' 
		SEE_VOLUME 	='Sealed Air Corp. (NYSE: SEE)' 
		HTZ_VOLUME 	='Hertz Global Holdings, Inc. (NYSE: HTZ)' 
		PEG_VOLUME 	='Public Service Enterprise Group Inc. (NYSE: PEG)' 
		CTSH_VOLUME ='Cognizant Technology Solns Corp. (NASDAQ: CTSH)' 
		BDX_VOLUME 	='Becton, Dickinson and Co. (NYSE: BDX)' ;

VAR 						JNJ_VOLUME HON_VOLUME NRG_VOLUME 
							CAR_VOLUME MRK_VOLUME CPB_VOLUME 
							PRU_VOLUME CB_VOLUME BBBY_VOLUME 
							ADP_VOLUME CELG_VOLUME DGX_VOLUME 
							SEE_VOLUME HTZ_VOLUME PEG_VOLUME 
							CTSH_VOLUME BDX_VOLUME;
TITLE "CORRELATION ANALYSIS OF TRADED STOCKS VOLUME DURING HURRICANE SANDY";
RUN;
/*
*%inc "/folders/myfolders/SAS303/corrpval.sas";   
*%corrpval(DATA=STOCKS_SANDY, corr=corr_vol, out=vol_corr);
*Stream a CSV representation of SASHELP.CARS directly to the user's browser.;
proc export data=corr_vol
            outfile=_dataout
            dbms=csv replace;
run;
%let _DATAOUT_MIME_TYPE=text/csv;
%let _DATAOUT_NAME=vol_cor.csv;
*/

Proc npar1way DATA=STOCKS_SANDY; 
class  HURRICANE_TIME_LINE; 
LABEL 	JNJ_CLOSE 	='Johnson & Johnson (NYSE:JNJ)' 
		HON_CLOSE 	='Honeywell International, Inc.(NYSE: HON)' 
		NRG_CLOSE 	='NRG Energy, Inc. (NYSE: NRG)' 
		CAR_CLOSE 	='Avis Budget Group, Inc.(NASDAQ: CAR)' 
		MRK_CLOSE 	='Merck & Co., Inc.(NYSE: MRK)'  
		CPB_CLOSE 	='Campbell Soup Company (NYSE: CPB)'
		PRU_CLOSE 	='Prudential Financial, Inc.(NYSE: PRU)'
		CB_CLOSE 	='Chubb Corporation (NYSE: CB)' 
		BBBY_CLOSE ='Bed Bath & Beyond Inc.(NASDAQ: BBBY)'
		ADP_CLOSE 	='Automatic Data Processing, Inc. (NASDAQ: ADP)' 
		CELG_CLOSE ='Celgene Corp. (NASDAQ: CELG)' 
		DGX_CLOSE 	='Quest Diagnostics Inc. (NYSE: DGX)' 
		SEE_CLOSE 	='Sealed Air Corp. (NYSE: SEE)' 
		HTZ_CLOSE 	='Hertz Global Holdings, Inc. (NYSE: HTZ)' 
		PEG_CLOSE 	='Public Service Enterprise Group Inc. (NYSE: PEG)' 
		CTSH_CLOSE ='Cognizant Technology Solns Corp. (NASDAQ: CTSH)' 
		BDX_CLOSE 	='Becton, Dickinson and Co. (NYSE: BDX)' ;

VAR JNJ_CLOSE HON_CLOSE NRG_CLOSE 
	CAR_CLOSE MRK_CLOSE CPB_CLOSE 
	PRU_CLOSE CB_CLOSE BBBY_CLOSE
	ADP_CLOSE CELG_CLOSE DGX_CLOSE
	SEE_CLOSE HTZ_CLOSE PEG_CLOSE 
	CTSH_CLOSE BDX_CLOSE;  
*exact wilcoxon; 
TITLE "NONPARAMETRIC TEST OF STOCK PRICE BEFORE, DURING AND AFTER HURRICANE SANDY"; 
run;
ODS graphics off;
QUIT; 