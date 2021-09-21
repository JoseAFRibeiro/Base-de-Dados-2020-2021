/*Definir definições globais para a base de dados*/
SHOW VARIABLES LIKE "local_infile";
SET GLOBAL local_infile = 'ON';
SHOW VARIABLES LIKE "local_infile";
SHOW VARIABLES LIKE 'innodb_buffer_pool_size';
SET GLOBAL	innodb_buffer_pool_size = 10737418240;
/*Criar bases de dados e tabelas a usar*/
CREATE DATABASE trabalho_bd;
/*CREATE DATABASE trabalho_bd;*/
USE trabalho_bd;
CREATE TABLE Title
	(tconst VARCHAR(10),
    titleType TINYTEXT,
	primaryTitle VARCHAR(100),
    originalTitle VARCHAR(100),
    isAdult BOOLEAN,
    startYear YEAR,
    endYear YEAR,
    runtimeMinutes int,
    genres VARCHAR(40),
    averageRating FLOAT,
    numVotes INT,
    PRIMARY KEY (tconst));
CREATE TABLE Person
	(nconst VARCHAR(10), 
	primaryName VARCHAR(40), 
	birthYear YEAR, 
	deathYear YEAR,
	primaryProfession VARCHAR(50),
	knownForTitles VARCHAR(100), 
	PRIMARY KEY (nconst),
    FOREIGN KEY(knownForTitles) REFERENCES Title(tconst));
    CREATE TABLE Principals
	(tconst VARCHAR(10),
	ordering SMALLINT(3),
    nconst VARCHAR(10),
    category VARCHAR(40),
    job VARCHAR(20),
    characters TINYTEXT,
    PRIMARY KEY (tconst),
    FOREIGN KEY (tconst) REFERENCES Title(tconst),
    FOREIGN KEY (nconst) REFERENCES Person(nconst));
CREATE TABLE Crew
	(tconst VARCHAR(10),
    directors VARCHAR(40),
    writers VARCHAR(40),
    PRIMARY KEY(tconst),
    FOREIGN KEY (tconst) REFERENCES Title(tconst),
    FOREIGN KEY (directors) REFERENCES Person(nconst),
    FOREIGN KEY(writers) REFERENCES Person(nconst));
CREATE TABLE Ratings 
	(tconst VARCHAR(10),
    averageRating FLOAT,
    numVotes INT,
    PRIMARY KEY (tconst),
    FOREIGN KEY (tconst) REFERENCES Title(tconst) );
    
#dividir titles e ratings
ALTER TABLE Title
DROP COLUMN averageRating;
ALTER TABLE Title
DROP COLUMN numVotes;

/*Verificar as tabelas*/
#DESC name_basics;
/*inserir ficheiros*/
#name_basics = Person
#title_basics + title_rating = Title
#title_crew = Crew
#title_principals = principals
LOAD DATA LOCAL INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/name_basics.tsv" INTO TABLE Person;
LOAD DATA LOCAL INFILE 
"C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/title_crew.tsv"
 INTO TABLE 
 Crew;
 LOAD DATA LOCAL INFILE 
"C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/title_principals.tsv"
 INTO TABLE 
 Principals;
 LOAD DATA LOCAL INFILE 
"C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/title_basics.tsv"
 INTO TABLE 
 Title;
  LOAD DATA LOCAL INFILE 
"C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/title_ratings.tsv"
 INTO TABLE 
 Ratings;
#DROP DATABASE trabalho_bd;
select count(tconst) from principals;
/* erros 1265 e 1452