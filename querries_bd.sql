
use trabalho_bd_2;	

/* titulo e rating de filmes com pontuação superior a 8.5 e mais de 50000 votos*/
SELECT t.primaryTitle, r.averageRating
 FROM title t join ratings r on t.tconst = r.tconst
 where (r.averageRating > 8.5) AND (t.titleType LIKE "movie") AND (r.numVotes > 50000) ;
 
 /*titulos dos filmes onde o Lucas Hedge participou*/
SELECT t.primaryTitle
FROM principals ppls JOIN Person per ON ppls.nconst = per.nconst
JOIN title t ON t.tconst = ppls.tconst
WHERE (per.primaryName LIKE 'Lucas Hedges');

/*Filmes que o Andrei Tarkovsky realizou*/
SELECT t.primaryTitle
FROM person per JOIN crew c ON (per.nconst LIKE CONCAT('%', c.directors, '%')
 OR per.nconst LIKE CONCAT(c.directors, '%')
 OR per.nconst LIKE CONCAT('%', c.directors))
JOIN title t ON t.tconst = c.tconst 
WHERE per.primaryName LIKE 'Andrei Tarkovsky';

/*Filmes em que Chantal Akerman foi argumentista*/
SELECT count(t.primaryTitle)
FROM title t JOIN crew c ON t.tconst = c.tconst 
JOIN person p ON (p.nconst LIKE CONCAT('%', c.writers, '%') 
OR p.nconst LIKE CONCAT(c.writers, '%')
OR p.nconst LIKE CONCAT('%', c.writers))
WHERE p.primaryName LIKE 'Chantal Akerman';
 
 
 
 
 
 
Select originalTitle, ratings.averageRating 
from Title JOIN ratings ON title.tconst = ratings.tconst
 where (isAdult = 1) AND (ratings.numVotes > 1000) order by ratings.averageRating desc; 
