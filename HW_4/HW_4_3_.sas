/*
 * ----ASSIGMENT_4---------
 * Author: Jose L Rodriguez
 * Assigment: 4
 * Probleml:  3
 * Date: October 2nd, 2014
 * SAS303 - FALL 2014
 * SAS platform 'Linux LIN X64 2.6.32-431.11.2.el6.x86_64' 
 * SAS version '9.04.01M1P12042013' 
 *
 */

DATA MEDICAL;
LENGTH MRI$ 12;
INPUT INVASIVE$ MRI$ COUNT;
DATALINES;
OCCLUDED OCCLUDED 15
OCCLUDED NON-OCCLUDED 8
NON-OCCLUDED OCCLUDED 10
NON-OCCLUDED NON-OCCLUDED 67
;
PROC FREQ DATA=MEDICAL ORDER=DATA;
TABLES INVASIVE*MRI/AGREE;
WEIGHT COUNT;
RUN;

/*

b. What is the strength of the inter-reliability of the two methods.
We use Kappa as a measure of agreement between two raters. The kappa statistics removes
the effect of the random agreement and provides a commonly used statistics of agreement.
From the output we can see that the kappa is 0.5068, indicating a medium/moderate 
agreement. The strength of the inter-realiability of these two methods relies in how
they correlate in some cases making an stronger hypothesis or disprove further our
hyphothesis.
*/