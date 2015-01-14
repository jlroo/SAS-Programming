*Unbalanced Data;
DATA agitation_level;
length gender$ 20;
DO music="Piano Interlude", "Mozart", "Easy Listening";
	DO stage="Early Stage","Late Stage";
		DO i=1 TO 5;
			if i le 2 then gender="male";
			else gender="female";
			input levels @@;
			output;
		END;
	END;
END;

DATALINES;
21 24 22 18 20 
12 15 18 20 19
9 7 9 8 12 
15 8 12 13 11
29 26 30 24 26
17 19 21 18 16
;

PROC SORT DATA=agitation_level;
BY levels;
run;
*to test if the means are the same or different;
PROC GLM DATA=agitation_level; *ANOVA dont show interaction plot;
TITLE "TWO-WAY ANOVA";
Class Gender Music Stage;
Model Levels = Gender| Music | Stage;
LSMeans Gender| Music | Stage;
Run;
quit;
