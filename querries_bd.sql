use trabalho_bd;
/* titulo e rating de filmes com pontuação superior a 8.5 e mais
de 50000 votos*/
/*TODO: MUDAR PARA A VISTA TITLE MAIS RATINGS*/
SELECT primaryTitle, averageRating
FROM conteudos
where (averageRating > 8.5) AND (titleType LIKE "movie") AND
(numVotes > 50000);
/*filme com mais votos*/
SELECT numVotes, primaryTitle
FROM conteudos
WHERE numVotes = (SELECT MAX(numvotes) FROM conteudos);
/*titulos dos filmes onde o Lucas Hedge participou*/
SELECT t.primaryTitle
FROM principals ppls JOIN Person per ON ppls.nconst = per.nconst
JOIN title t ON t.tconst = ppls.tconst
WHERE (per.primaryName LIKE 'Lucas Hedges');
/*Filmes que o Andrei Tarkovsky realizou*/
SELECT t.primaryTitle
FROM person per JOIN crew c ON (per.nconst LIKE CONCAT('%',
c.directors, '%')
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
/*Ano com mais filmes*/
SELECT COUNT(startYear), startYear
19
FROM Conteudos
WHERE titleType LIKE 'movie'
GROUP BY startYear
ORDER BY COUNT(startYear) desc
LIMIT 0,1;
/*Ano com melhor média de user scores* do século XX*/
SELECT AVG(averageRating), startYear
FROM Conteudos
WHERE (startYear > 1901) AND( startYear< 2000)
GROUP BY startYear
ORDER BY AVG(averageRating) desc
LIMIT 0,1;
/*Pessoas com o titulo shrek no seu known for*/
SELECT per.primaryName
FROM Person per
WHERE (knownForTitles IN
(SELECT t.tconst FROM title t WHERE (t.primaryTitle like 'Shrek')
AND (t.titleType like 'movie')))
AND (per.primaryProfession like '%art%'); 
