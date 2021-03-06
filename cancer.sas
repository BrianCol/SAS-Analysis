data cancer;
	infile datalines delimiter=',';
	input type $ sex age days;
	/* logdays = log(days)	 */
	datalines;
stomach,2,61,124
stomach,1,69,42
stomach,2,62,25
stomach,2,66,45
stomach,1,63,412
stomach,1,79,51
stomach,1,76,1112
stomach,1,54,46
stomach,1,62,103
stomach,1,46,146
stomach,1,57,340
stomach,2,59,396
bronchus,1,74,81
bronchus,1,74,461
bronchus,1,66,20
bronchus,1,52,450
bronchus,2,48,246
bronchus,2,64,166
bronchus,1,70,63
bronchus,1,77,64
bronchus,1,71,155
bronchus,1,39,151
bronchus,1,70,166
bronchus,1,70,37
bronchus,1,55,223
bronchus,1,74,138
bronchus,1,69,72
bronchus,1,73,245
colon,2,76,248
colon,2,58,377
colon,1,49,189
colon,1,69,1843
colon,2,70,180
colon,2,68,537
colon,1,50,519
colon,2,74,455
colon,1,66,406
colon,2,76,365
colon,2,56,942
colon,2,74,372
colon,1,58,163
colon,2,60,101
colon,1,77,20
colon,1,38,283
rectum,2,56,185
rectum,2,75,479
rectum,2,57,875
rectum,1,56,115
rectum,1,68,362
rectum,1,54,241
rectum,1,59,2175
bladder,1,93,4288
bladder,2,70,3658
bladder,2,77,51
bladder,2,72,278
bladder,1,44,548
kidney,2,71,205
kidney,2,63,538
kidney,2,51,203
kidney,1,53,296
kidney,1,57,870
kidney,1,73,331
kidney,1,69,1685
;

data cancer;
set cancer;
logdays = log(days);
run;

/*ANOVA test  */
proc glm data = cancer;
	class type sex;
	model days = type sex sex*type;
run;

proc glm data = cancer;
	class sex type;
	model days = sex type type*sex;
run;


/*ANOVA test  */
proc glm data = cancer;
	class type sex;
	model logdays = type sex sex*type;
run;

proc glm data = cancer;
	class sex type;
	model logdays = sex type type*sex;
run;
