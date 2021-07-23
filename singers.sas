data heights;
	infile datalines delimiter=',';
	input height sex $ part $;
	/* logdays = log(days)	 */
	datalines;
64,f,high
62,f,high
66,f,high
65,f,high
60,f,high
61,f,high
65,f,high
66,f,high
65,f,high
63,f,high
67,f,high
65,f,high
62,f,high
65,f,high
68,f,high
65,f,high
63,f,high
65,f,high
62,f,high
65,f,high
66,f,high
62,f,high
65,f,high
63,f,high
65,f,high
66,f,high
65,f,high
62,f,high
65,f,high
66,f,high
65,f,high
61,f,high
65,f,high
66,f,high
65,f,high
62,f,high
65,f,low
62,f,low
68,f,low
67,f,low
67,f,low
63,f,low
67,f,low
66,f,low
63,f,low
72,f,low
62,f,low
61,f,low
66,f,low
64,f,low
60,f,low
61,f,low
66,f,low
66,f,low
66,f,low
62,f,low
70,f,low
65,f,low
64,f,low
63,f,low
65,f,low
69,f,low
61,f,low
66,f,low
65,f,low
61,f,low
63,f,low
64,f,low
67,f,low
66,f,low
68,f,low
69,m,high
72,m,high
71,m,high
66,m,high
76,m,high
74,m,high
71,m,high
66,m,high
68,m,high
67,m,high
70,m,high
65,m,high
72,m,high
70,m,high
68,m,high
73,m,high
66,m,high
68,m,high
67,m,high
64,m,high
72,m,low
70,m,low
72,m,low
69,m,low
73,m,low
71,m,low
72,m,low
68,m,low
68,m,low
71,m,low
66,m,low
68,m,low
71,m,low
73,m,low
73,m,low
70,m,low
68,m,low
70,m,low
75,m,low
68,m,low
71,m,low
70,m,low
74,m,low
70,m,low
75,m,low
75,m,low
69,m,low
72,m,low
71,m,low
70,m,low
71,m,low
68,m,low
70,m,low
75,m,low
72,m,low
66,m,low
72,m,low
70,m,low
69,m,low
;

/*Print mean and sd for each treatment */
proc means data = heights;
	class sex part;
	var height;
run;

/*Side-by-side boxplots for each treatment  */
proc boxplot data = heights;
	plot (height)*part (sex)=part / boxstyle=schematic;
run;

/*Side-by-side boxplots for each treatment  */
proc boxplot data = heights;
	plot (height)*sex (part)=sex / boxstyle=schematic;
run;

/* ANOVA test (Sex on x-axis) */
proc glm data = heights;
	class sex part;
	model height = sex part part*sex;
run;

/* ANOVA test (Part on x-axis) */
proc glm data = heights;
	class part sex;
	model height = sex part sex*part;
run;

