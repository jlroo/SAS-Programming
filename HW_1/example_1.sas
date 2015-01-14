Data Parts;
input machine Deviation @@;
datalines;
1 -.0653 1 0.0141 1 -.0702 1 -.0734 1 -.0649 1 -.0601
2 -.0631 2 -.0148 2 -.0731 2 -.0764 2 -.0275 2 -.0497
1 -.0741 1 -.0673 1 -.0573 1 -.0629 1 -.0671 1 -.0246
2 -.0222 2 -.0807 2 -.0621 2 -.0785 2 -.0544 2 -.0511
1 -.0138 1 -.0609 1 0.0038 1 -.0758 1 -.0731 1 -.0455
;
proc univariate data= Parts noprint;
title "Histogram";
Histogram Deviation /normal midpoints=-0.10 to 0.03 by 0.01;
inset skewness = "Skew" (4.2)
	Kurtosis= "Kurtosis" (4.2)/
		Pos=NE
		Height=4;
run;