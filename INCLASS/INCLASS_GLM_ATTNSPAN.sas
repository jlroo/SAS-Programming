Data bkf_today;
input type$ attnspan;
datalines;
no_b 8
li_b 14
fu_b 10
no_b 7
li_b 16
fu_b 12
no_b 9
li_b 12
fu_b 16
no_b 13
li_b 17
fu_b 15
no_b 10
li_b 11
fu_b 12
;
Proc GLM;
*proc anova;
*proc npar1way wilcoxon;
Class  type; *npar1way wilcoxon;
*var attnspan; *npar1way wilcoxon;
Model attnspan = type;
Means type;
Run;
