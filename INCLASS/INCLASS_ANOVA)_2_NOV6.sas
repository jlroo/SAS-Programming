DATA agitation_level;
DO music="Piano Interlude", "Mozart";
DO stage="Early Stage","Middle Stage";
DO subj=1 TO 5;
	INPUT levels @@;
	OUTPUT;
END;
END;
END;

DATALINES;
21 24 22 18 20 
12 15 18 20 19
9 7 9 8 12 
15 8 12 13 11
;
/*
PROC SORT DATA=agitation_level;
BY levels;
run;

PROC GLM DATA=agitation_level; *ANOVA dont show interaction plot;
TITLE "TWO-WAY ANOVA";
CLASS music stage;
model levels=music | stage;
means music | stage/tukey snk ;
run;
quit;

PROC SORT DATA=agitation_level;  *T-test stage by music 11/11/2014;
BY stage;
proc ttest;
by stage;
class music;
var levels;
run;

PROC SORT DATA=agitation_level;  *T-test music by stage 11/11/2014;
BY music;
proc ttest;
by music;
class stage;
var levels;
run;
*/

PROC SORT DATA=agitation_level;
BY levels;
run;
*to test if the means are the same or different;
PROC GLM DATA=agitation_level; *ANOVA dont show interaction plot;
TITLE "TWO-WAY ANOVA";
CLASS music stage;
model levels = music | stage;
lsmeans music | stage/ adjust=scheffe ; *tukey , sidak , sheffe , bonferroni (bon) ;
run;
quit;

/*
Ho: The mean level of agitation for the population mean are the same
Ha: The mean level of agitation for the population mean are not the same

Based on the p-value < 0.001 we reject the null hypothesis that all the agitation levels are the same for all four scenarios.  What next?
If reject null, analyze main or factor effects. 
If fail to reject null, done!

*/
