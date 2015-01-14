DATA REALSTATE;
INPUT House	Price Living_Area Floors Bedrooms Baths;
datalines;
1 69 6 1 2 1
2 118.5	10 1 2 2
3 116.5	10 1 3 2
4 125 11 1 3 2
5 129.9	13 1 3 1.5
6 135 13 2 3 2.5
7 139.9	13 1 3 2
8 147.9	17 2 3 2.5
9 160 19 2 3 2
10 169.9 18	1 3	2
11 134.9 13	1 4	2
12 155 18 1	4 2
13 169.9 17	2 4	3
14 194.5 20	2 4	3
15 209.9 21	2 4	3
;
PROC REG DATA=REALSTATE;
MODEL Price= Living_Area Floors Bedrooms Baths/P R;
PLOT H.*(Living_Area Floors Bedrooms Baths);
RUN;
