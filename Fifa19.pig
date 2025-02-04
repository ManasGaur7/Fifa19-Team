data = LOAD '/home/manas/Downloads/Datasets/data.csv' USING PigStorage(',');
DUMP data;
displaySelectedInfo = FOREACH data GENERATE $2 AS NAME, $5 AS NATIONALITY, $7 AS OVERALL, $9 AS CLUB;
DUMP displaySelectedInfo;
displayLimit = LIMIT displaySelectedInfo 50;
rand1 = FOREACH displayLimit GENERATE RANDOM(),NAME,NATIONALITY,OVERALL,CLUB;
rand2 = FOREACH displayLimit GENERATE RANDOM(),NAME,NATIONALITY,OVERALL,CLUB;
rand1Shuffle = ORDER rand1 BY $0 DESC;
rand2Shuffle = ORDER rand2 BY $0 DESC;
limitRand1 = LIMIT rand1Shuffle 11;
limitRand2 = LIMIT rand2Shuffle 11;
filterName1 = FOREACH limitRand1 GENERATE $1;
filterName2 = FOREACH limitRand2 GENERATE $1;
DUMP filterName1;
DUMP filterName2;
