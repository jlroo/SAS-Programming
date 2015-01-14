DATA INVESTMENT_RATE;
Input  invest rate;
i = 1;
do until (i=6);
Invest = invest*rate;
i= i+1;
Output;
end;
drop   i;
Datalines;
10000 1.2
15000 0.5
1200 0.2
12500 0.5
25000 2.3
18500 4.5
;
RUN;
