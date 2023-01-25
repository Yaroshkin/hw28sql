DROP TABLE IF EXISTS "Teachers";
CREATE TABLE "Teachers" (
	"id"	INTEGER NOT NULL UNIQUE, 
	"name"	TEXT NOT NULL,
	"surname"	TEXT NOT NULL,
	"Salary" INTEGER NOT NULL,
	"DateOfEmployment" TEXT NOT NULL,
	"Position"	TEXT NOT NULL,
	"isAssistent" NUMERIC NOT NULL DEFAULT 0,
	"isProfessor" NUMERIC NOT NULL DEFAULT 0,
	"Premium" INTEGER NOT NULL DEFAULT 0,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "Teachers"  VALUES (1,"Иван","Середа",1200,"12.08.1998","Професор",0,1,0);
INSERT INTO "Teachers"  VALUES (2,"Степан","След",1100,"15.02.1997","Професор",0,1,0);
INSERT INTO "Teachers"  VALUES (3,"Антон","Ганжа",1050,"10.03.2001","Ассистент",1,0,0);
INSERT INTO "Teachers"  VALUES (4,"Алексей","Вторник",800,"06.04.2003","Ассистент",1,0,0);
INSERT INTO "Teachers"  VALUES (5,"Юрий","Вишня",1300,"02.02.2002","Ассистент",1,0,0);
INSERT INTO "Teachers"  VALUES (6,"Петр","Вниз",1500,"25.04.2000","Професор",0,1,0);
INSERT INTO "Teachers"  VALUES (7,"Илья","Илююхин",900,"21.06.2010","Ассистент",1,0,0);
INSERT INTO "Teachers"  VALUES (8,"Андрей","Простой",1030,"20.06.2008","Професор",0,1,0);
INSERT INTO "Teachers"  VALUES (9,"Иван","Терехин",1000,"28.05.2013","Ассистент",1,0,0);
INSERT INTO "Teachers"  VALUES (10,"Сергей","Плохой",840,"24.01.2001","Професор",0,1,0);

DROP TABLE IF EXISTS "Groups";
CREATE TABLE "Groups" (
	"id"	INTEGER NOT NULL,
	"Name"	TEXT NOT NULL UNIQUE,
	"Rating"	INTEGER NOT NULL,
	"Year"	INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "Groups" VALUES (1,"OBD1",4,3);
INSERT INTO "Groups" VALUES (2,"OBD2",3,5);
INSERT INTO "Groups" VALUES (3,"OBD3",4,3);
INSERT INTO "Groups" VALUES (4,"OBD4",3,2);
INSERT INTO "Groups" VALUES (5,"OBD5",5,1);
INSERT INTO "Groups" VALUES (6,"OBD6",4,3);
INSERT INTO "Groups" VALUES (7,"OBD7",5,1);
INSERT INTO "Groups" VALUES (8,"OBD8",4,3);
INSERT INTO "Groups" VALUES (9,"OBD9",3,2);
INSERT INTO "Groups" VALUES (10,"OBD10",4,3);

DROP TABLE IF EXISTS "Departments";
CREATE TABLE "Departments" (
	"id"	INTEGER NOT NULL UNIQUE,
	"Name"	TEXT NOT NULL UNIQUE,
	"Financing"	INTEGER NOT NULL DEFAULT 0,
	PRIMARY KEY("id" AUTOINCREMENT)
);

INSERT INTO "Departments" VALUES (1,"Computer Science",13500);
INSERT INTO "Departments" VALUES (2,"Nature Science",20000);
INSERT INTO "Departments" VALUES (3,"Chemical",14000);
INSERT INTO "Departments" VALUES (4,"Mathematic",11500);
INSERT INTO "Departments" VALUES (5,"English",11500);
INSERT INTO "Departments" VALUES (6,"Phisic Science",13500);
INSERT INTO "Departments" VALUES (7,"Mechanic",10500);
INSERT INTO "Departments" VALUES (8,"Security Science",12000);
INSERT INTO "Departments" VALUES (9,"Science",9500);
INSERT INTO "Departments" VALUES (10,"Higher mathematics",8500);


DROP TABLE IF EXISTS "Faculties";
CREATE TABLE "Faculties" (
	"id"	INTEGER NOT NULL UNIQUE,
	"Name"	TEXT NOT NULL UNIQUE,
	"Decan"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);

INSERT INTO "Faculties" VALUES (1,"Computer Science","Арнольд");
INSERT INTO "Faculties" VALUES (2,"Mathematic","Альфред");
INSERT INTO "Faculties" VALUES (3,"Finance","Бенжамин");

-- 1. Вывести таблицу кафедр, но расположить ее поля в обратном порядке. + сортировка по названию

SELECT * FROM "Departments" 
ORDER BY Name DESC ;


-- 2. Вывести названия групп и их рейтинги с уточнением имен полей именем таблицы. + сортировка по рейтингу от большего к меньшему + первые 3 

SELECT Name,Rating FROM "Groups" ;
SELECT * FROM "Groups" ORDER BY "Rating" DESC LIMIT 3;

-- 5. Вывести фамилии преподавателей, которые являются профессорами и ставка которых превышает 1050.


SELECT surname FROM "Teachers" WHERE Salary >1050 AND Position == "Професор";


-- 6. Вывести названия кафедр, фонд финансирования которых меньше 11000 или больше 25000.от 11000 до 25000

SELECT "Name" FROM "Departments" WHERE Financing >= 11000 and Financing <=25000;

-- 7.. Вывести названия факультетов кроме факультета “Computer Science”

SELECT "Name" FROM "Faculties" WHERE "Name" != "Computer Science"; 

-- 8. Вывести фамилии и должности преподавателей, которые не являются профессорами.

SELECT "surname","Position" FROM "Teachers" WHERE "Position" != "Професор";

--10. Вывести фамилии и ставки ассистентов.

SELECT "surname","Salary" FROM "Teachers" WHERE "Position" == "Ассистент";

