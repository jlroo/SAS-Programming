*Testing Difference of Means;
DATA Reedfish;
Input temp oxygen @@;
Datalines;
25 49 25 34 25 24 25 32 25 52 25 14 
25 28 25 18 25 28 25 47 25 60
33 28 33 55 33 45 33 51 33 41 33 27 
33 44 33 48 33 54 33 67 33 46 33 59
;

PROC TTEST SIDES=U; *test the probabilities;
CLASS TEMP ;
VAR OXYGEN;*THIS WILL ALWAYS BE A NUMERICAL TYPE VARIABLE;
RUN;

/*
### FROM TABLE #### Method Variances DF t- Value Pr > |t| ####
Since p < 0.05, we reject the Null Hypothesis.
There is a difference between the oxygen intake at the two temperature levels.

### FROM TABLE ####  Equality of Variances #############
Since Pr > F is greater than 0.05, the difference 
In variances is NOT significant, use pooled variance.

Hypothesis:
 H0: (µ1 - µ2) = D0
 HA: (µ1 - µ2) ?  D0 
     where is D0 some given difference, usually D0 = 0
*/
