DATA MULTI_REG;
INPUT yield fertilizer water;
DATALINES;
40 100 10
45 100 20
52 100 30
44 200 10
49 200 20
57 200 30
46 300 10
51 300 20
55 300 30
52 400 10
55 400 20
60 400 30
;
ods graphics on;
proc reg;
model yield= water fertilizer/P R;
plot H.*(water fertilizer);
run;

proc g3grid data = MULTI_REG out = MULTI_REG_OUT;
  grid fertilizer*water = yield/ 
    axis1 = 90 to 500 by 50 
    axis2 = 5 to 35 by 50 ; *scalling;
run;

proc g3d data=MULTI_REG_OUT;
  scatter fertilizer*water = yield;
run;

Proc g3d data=MULTI_REG_OUT;
  plot fertilizer*water = yield;
run;

ods graphics off;
