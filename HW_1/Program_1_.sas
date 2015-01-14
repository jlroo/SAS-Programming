
DATA program_1_;
/* 
----ASSIGMENT_1---------
Author: Jose L Rodriguez
Assigment: 1
Probleml:  1.1
Date: September 4th, 2014
SAS303 - FALL 2014

----INITIAL VARIABLES---------------------------
SUBJ 	 -> Subject Number			(Character)
HEIGHT	 -> Height in inches		(Numeric)
WT_INIT	 -> Initial weight in lbs	(Numeric)
WT_FINAL -> Final weight			(Numeric)
------------------------------------------------
*/

input SUBJ$ 1-3 HEIGHT 4-5 WT_INIT 6-8 WT_FINAL 9-11;/*create input variables*/

/*
----CALCULATIONS---------------------------------
BMI_INIT = WT_INIT/((HEIGHT)^2)(BMI stands for body mass index)
BMI_FINAL = WT_FINAL/((HEIGHT)^2)
BMI_DIFF = (BMI_FINAL - BMI_INIT)
WT_kg = (WT_INIT/2.2)
HEIGHT_m = 0.0254×(HEIGHT_in)   
--------------------------------------------------
*/

WT_INIT_kg = (WT_INIT/2.2);
WT_FINAL_kg = (WT_FINAL/2.2);
HEIGHT_m = 0.0254*(HEIGHT);
BMI_INIT = WT_INIT_kg/((HEIGHT_m)**2);/*BMI_INIT in kg/m*/
BMI_FINAL = WT_FINAL_kg/((HEIGHT_m)**2);
BMI_DIFF = BMI_FINAL-BMI_INIT;

drop WT_INIT WT_FINAL WT_INIT_kg WT_FINAL_kg HEIGHT_m ;/*drop convertions output*/

/*DATA INPUT*/
Datalines;
00768155150
00272250240
00563240200
00170345298
;
proc sort;
by SUBJ;*SORT by SUBJ variable;
title "Body Mass Index Calculation";
proc print noobs;*No Observations;
Run;