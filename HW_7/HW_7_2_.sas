DATA DELIVERY_TIME;
DATALINES;
MamaRosa 14.3 MamaRosa 17.8 MamaRosa 21.5 MamaRosa 17.3 MamaRosa 18.5 MamaRosa 14.9
AcePizza 22.8 AcePizza 20.4 AcePizza 17.4 AcePizza 18.3 AcePizza 17.5 AcePizza 25.2
AcePizza 19.7 AcePizza 21.1
;

/*
2)  Mama Rosa’s pizza says it’s the fastest in town. Mama Rosa’s biggest competitor is Ace Pizza.  
	An independent study tested the length of time it took for each company to complete the order 
	and delivery the pizza. The data is below.

a)	Use SAS to perform a one sided two sample t-test (use the sides = command) on the data with the 
b)	assumption that Mama Rosa’s Pizza delivers the pizza faster.  
c)	State the null and alternative hypothesis. 
d)	Run your SAS code and state your conclusion at a 95% confidence level.  
e)	Explain how you choose your p-value.  
f)	Be careful, SAS runs sorts the data in alphabetical order so make your comparison based on this.  
g)	Include the t-test table, equality of variance table and a histogram of the data.  

a)	Use SAS to perform a two sided two sample t-test on the data with the 
b)	assumption that the delivery times of Ace Pizza and Mama Rosa’s Pizza are different.  
c)	State the null and alternative hypothesis. 
d)	Run your SAS code and state your conclusion at a 95% confidence level.  
e)	Explain how you choose your p-value.    
f)	Include the t-test table, equality of variance table and a histogram of the data.
g)	The data is not perfectly normal.
h)	Run the Wilcoxon Rank Sum test for the data. 
i)	State the Null and Alternative Hypothesis for a two-sided test and explain your conclusion based on the SAS output. 
j)	Include the Wilcoxon table in your output. 
k)	Now answer the question, does Mama Rosa deliver pizzas faster?  Explain your choice.

*/

