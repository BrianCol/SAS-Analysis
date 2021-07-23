data oreos;
	infile datalines delimiter=',';
	input run experiment treatment $ replicate milkabsgrams weightbeforeg weightafterg;
	datalines;
1,25,DoubleStuf,5,6.19,14.9,21.09
2,1,Regular,1,7.08,11.56,18.64
3,55,Golden,15,6.44,11.82,18.26
4,37,DoubleStuf,17,6.22,14.96,21.18
5,13,Regular,13,7.16,11.73,18.89
6,47,Golden,7,6.71,11.77,18.48
7,51,Golden,11,6.71,11.85,18.56
8,52,Golden,12,6.67,11.46,18.13
9,15,Regular,15,6.99,11.45,18.44
10,7,Regular,7,7.38,11.75,19.13
11,20,Regular,20,7.76,11.4,19.16
12,8,Regular,8,7.91,11.61,19.52
13,54,Golden,14,6.73,11.65,18.38
14,59,Golden,19,6.75,11.67,18.42
15,19,Regular,19,7.49,11.35,18.84
16,45,Golden,5,6.89,11.63,18.52
17,2,Regular,2,7.85,11.42,19.27
18,60,Golden,20,6.93,12.14,19.07
19,32,DoubleStuf,12,6.27,15.26,21.53
20,34,DoubleStuf,14,6.26,15.15,21.41
21,12,Regular,12,7,11.22,18.22
22,33,DoubleStuf,13,5.93,14.78,20.71
23,39,DoubleStuf,19,6.36,15.39,21.75
24,56,Golden,16,6.56,11.59,18.15
25,57,Golden,17,6.5,11.81,18.31
26,16,Regular,16,7.49,11.48,18.97
27,42,Golden,2,6.41,11.54,17.95
28,35,DoubleStuf,15,5.97,14.91,20.88
29,49,Golden,9,6.46,11.42,17.88
30,30,DoubleStuf,10,5.84,15.27,21.11
31,11,Regular,11,7.58,11.63,19.21
32,17,Regular,17,7.44,11.47,18.91
33,6,Regular,6,7.6,10.99,18.59
34,22,DoubleStuf,2,5.91,14.88,20.79
35,40,DoubleStuf,20,5.9,15.85,21.75
36,10,Regular,10,7.65,11.41,19.06
37,27,DoubleStuf,7,5.9,15.17,21.07
38,36,DoubleStuf,16,6.91,16.11,23.02
39,43,Golden,3,7.05,11.47,18.52
40,21,DoubleStuf,1,6.02,15.05,21.07
41,26,DoubleStuf,6,6.58,15.32,21.9
42,9,Regular,9,7.73,11.84,19.57
43,5,Regular,5,7.55,11.47,19.02
44,18,Regular,18,7.44,11.66,19.1
45,53,Golden,13,6.51,11.43,17.94
46,29,DoubleStuf,9,6.25,15.3,21.55
47,3,Regular,3,7.28,12.1,19.38
48,31,DoubleStuf,11,6.32,15.96,22.28
49,58,Golden,18,6.84,11.74,18.58
50,23,DoubleStuf,3,6.11,15.1,21.21
51,38,DoubleStuf,18,6.59,15.72,22.31
52,41,Golden,1,6.74,11.63,18.37
53,28,DoubleStuf,8,6.28,15.55,21.83
54,44,Golden,4,6.49,11.84,18.33
55,48,Golden,8,7.08,11.51,18.59
56,14,Regular,14,7.29,12.29,19.58
57,24,DoubleStuf,4,6.25,14.98,21.23
58,4,Regular,4,7.11,11.69,18.8
59,50,Golden,10,6.24,11.71,17.95
60,46,Golden,6,6.6,11.68,18.28
;
run;

/*ANOVA test  */
proc glm data = oreos;
	class treatment;
	model milkabsgrams = treatment;
	means treatment;
run;