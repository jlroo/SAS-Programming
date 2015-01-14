DATA MERGE_P_PV;
/*
 * ----ASSIGMENT_2---------
 * Author: Jose L Rodriguez
 * Assigment: 2
 * Probleml:  2.1c
 * Date: September 18th, 2014
 * SAS303 - FALL 2014
 * SAS platform 'Linux LIN X64 2.6.32-431.11.2.el6.x86_64' 
 * SAS version '9.04.01M1P12042013' 
 *
 */
MERGE PATIENT PATIENT_VITALS;
PROC BOXPLOT DATA=MERGE_P_PV;
PLOT HR*RACE;
RUN;
