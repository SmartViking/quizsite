DROP TABLE IF EXISTS alt_question;
CREATE TABLE alt_question (
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       question STRING NOT NULL,
       answer INTEGER NOT NULL,
       	      -- 1 2 or 3, depending on which alternative is correct

       alt_1 STRING NOT NULL,
       alt_2 STRING NOT NULL,
       alt_3 STRING NOT NULL
);


INSERT INTO alt_question ( question, answer, alt_1, alt_2, alt_3 )
VALUES ("What is the world's longest river?", 3, "Nile","Yangtze","Amazon");

INSERT INTO alt_question ( question, answer, alt_1, alt_2, alt_3 )
VALUES ("What is love?", 2,"An emotion of a strong affection and personal attachment", "Baby don't hurt me","There's no such thing");

INSERT INTO alt_question ( question, answer, alt_1, alt_2, alt_3 )
VALUES ("What is the same as 2*2", 1, "2*2","5","3");

INSERT INTO alt_question ( question, answer, alt_1, alt_2, alt_3 )
VALUES ("In which century was color photography invented?", 2, "1700-1800","1800-1900","1900-2000");

INSERT INTO alt_question ( question, answer, alt_1, alt_2, alt_3 )
VALUES ("How fast is the speed of light?", 3, "Slow","Very Slow","Faster than slow");

INSERT INTO alt_question ( question, answer, alt_1, alt_2, alt_3 )
VALUES ("On which continent is Bolivia located?", 1, "South America","Asia","Europe");