DATA REALSTATE;
INPUT House	Price Living_Area Floors Bedrooms Baths garage;
IF garage="Y" then gar=1;
ELSE gar=0;
datalines;
1 69 6 1 2 1 N
2 118.5	10 1 2 2 Y
3 116.5	10 1 3 2 N
4 125 11 1 3 2 Y
5 129.9	13 1 3 1.5 Y
6 135 13 2 3 2.5 Y
7 139.9	13 1 3 2 Y
8 147.9	17 2 3 2.5 Y
9 160 19 2 3 2 Y
10 169.9 18	1 3	2 Y
11 134.9 13	1 4	2 Y
12 155 18 1	4 2 N
13 169.9 17	2 4	3 N
14 194.5 20	2 4	3 Y
15 209.9 21	2 4	3 Y
;
/*
PROC REG DATA=REALSTATE;
MODEL Price= Living_Area Floors Bedrooms Baths/P R;
PLOT H.*(Living_Area Floors Bedrooms Baths);
RUN;
*/

PROC REG DATA=REALSTATE;
MODEL Price= Living_Area Floors Bedrooms Baths gar/ R P selection = stepwise best = 3;
RUN;
QUIT;
