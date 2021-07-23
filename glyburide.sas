/*Upload data as glyburide
The data's delimiter is a comma
The data contains three variables: id, treatment, fatmass (percent of fat mass)  */
data glyburide;
	infile datalines delimiter=',';
	input id treatment $ fatmass;
	datalines;
1,insulin,9.16
2,insulin,5.81
3,insulin,7.88
4,insulin,15.67
5,insulin,9.25
6,insulin,9.89
7,insulin,16.92
8,insulin,7.03
9,insulin,7.99
10,insulin,10.45
11,insulin,6.87
12,insulin,8.66
13,insulin,14.74
14,insulin,15.28
15,insulin,8.64
16,insulin,10.04
17,insulin,14.33
18,insulin,16.41
19,insulin,9.4
20,insulin,11.96
21,insulin,21.04
22,insulin,14.71
23,insulin,3.13
24,insulin,17.38
25,insulin,11.01
26,insulin,15.66
27,insulin,12.45
28,insulin,5.19
29,insulin,7.31
30,insulin,5.5
31,insulin,16.41
32,insulin,4.93
33,insulin,12.25
34,insulin,15.99
35,insulin,8.21
36,insulin,13.99
37,insulin,14.28
38,insulin,12.19
39,insulin,13.87
40,insulin,5.77
41,insulin,11.55
42,glyburide,4.42
43,glyburide,9.93
44,glyburide,18.48
45,glyburide,16.6
46,glyburide,4.3
47,glyburide,9.16
48,glyburide,4.23
49,glyburide,14.83
50,glyburide,18.2
51,glyburide,9.68
52,glyburide,9.63
53,glyburide,9.19
54,glyburide,18.78
55,glyburide,17.41
56,glyburide,23.3
57,glyburide,9.96
58,glyburide,15.13
59,glyburide,14.16
60,glyburide,12.92
61,glyburide,10.66
62,glyburide,18.42
63,glyburide,2.98
64,glyburide,5.2
65,glyburide,22.14
66,glyburide,12.44
67,glyburide,13.64
68,glyburide,20.3
69,glyburide,16.92
70,glyburide,4.52
71,glyburide,3.88
72,glyburide,5.7
73,glyburide,13.57
74,glyburide,4.54
75,glyburide,15.53
76,glyburide,13.63
77,glyburide,15.42
78,glyburide,19.04
79,glyburide,13.7
80,glyburide,13.95
81,glyburide,21.47
82,glyburide,16.85
;
run;

/*Print data as a table  */
proc print data=glyburide;
run;

/*Print the contents of the data  */
proc contents data=glyburide;
run;

/*Find the means of the data of the percent of fat mass  */
proc means data=glyburide;
	class treatment;
	var fatmass;
run;

/*Sort the data by the treatment each mother received  */
proc sort data=glyburide;
	by treatment;
run;

/*Plot the percent of fat mass per treatment (glybruide and insulin)  as two side by side boxplots */
proc boxplot data=glyburide;
	plot fatmass *treatment / boxstyle=schematic;
run;


*Homework 3;
/*Two sample t-test for treatments glyburide and insulin*/
proc ttest data=glyburide;
	class treatment;
	var fatmass;
run;
