DATA agitation_level;
DO music="Piano Interlude", "Mozart","Easy Listening";
DO subj=1 TO 10;
	INPUT levels @@;
	OUTPUT;
END;
END;
DATALINES;
21 24 22 18 20 12 15 18 20 19
9 7 9 8 12 15 8 12 13 11
29 26 30 24 26 17 19 21 18 16
;
PROC SORT DATA=agitation_level;
BY levels;
run;
PROC ANOVA DATA=agitation_level;
TITLE "ONE-WAY ANOVA";
CLASS music;
model levels=music;
means music/tukey snk ;
run;
/*
Ho: The mean level of agitation is the same for patients
Ha: The mean level of agitation is not the same for patients
*/
