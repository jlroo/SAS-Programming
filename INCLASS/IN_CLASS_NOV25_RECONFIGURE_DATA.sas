data reconfigure_data;
retain bptime0-bptime2;
set repeated_anova;
By subj;
if time = 1 then bptime0 = bp;
else if time = 2 then bptime1 = bp;
else if time = 3 then bptime2 = bp;
if last.subj then output;
keep subj routine bptime0-bptime2;
run;

/*
PROC PRINT DATA=reconfigure_data;
RUN;
*/

Proc GLM data=reconfigure_data;
class routine;
model bptime1 bptime2 bptime3 = routine;
Repeated heartrate 3 /printe;
lsmeans routine;
run;
