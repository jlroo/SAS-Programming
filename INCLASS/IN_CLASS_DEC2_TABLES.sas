Data depressiondrug;
Input clinic $ treatment $ response $ frequency;
Datalines;
A drug improved 17
A placebo impoved 26
A drug not_improved 24
A palcevo not_improved 24
B drug improved 35
B placebo impoved 17
B drug not_improved 14
B palcevo not_improved 18
C drug improved 37
C placebo impoved 29
C drug not_improved 13
C palcevo not_improved 16
;
Proc Freq data = depressiondrug order = data;
Table treatment*response / chisq cmh norow nocol expected;
*tables clinic*drugplacebo*effective / 		expected norow nocol all;
Weight frequency;
Run;

/*
In general :
tables stratifiedvar*casecontrol*response

CMH option -Simple CMH results
tables clinic*drugplacebo*effective / 		expected norow nocol cmh;

all option – Analysis of all tables + stratified:
tables clinic*drugplacebo*effective / 		expected norow nocol all;

*/

