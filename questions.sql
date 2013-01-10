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
VALUES ("How many balls do I have", 3, "1","23","2");

INSERT INTO alt_question ( question, answer, alt_1, alt_2, alt_3 )
VALUES ('What is love?', 1, "Baby don't hurt me","not correct answer","68!");

INSERT INTO alt_question ( question, answer, alt_1, alt_2, alt_3 )
VALUES ("What's 2*2?", 1, "2*2","BALLS???","NOT! balls, something that's not balls!");

INSERT INTO alt_question ( question, answer, alt_1, alt_2, alt_3 )
VALUES ("How can I ever trust you again? How can I trust you after this?", 3, "You can't","DOOOO IIIT","calm yo tits");

INSERT INTO alt_question ( question, answer, alt_1, alt_2, alt_3 )
VALUES ("How fast is the speed of light?", 2, "42","Very fast","Slower than airplanes");

INSERT INTO alt_question ( question, answer, alt_1, alt_2, alt_3 )
VALUES ("Are you dead?", 3, "Yes","No","NAY");