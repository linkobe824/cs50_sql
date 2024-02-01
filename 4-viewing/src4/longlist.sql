SELECT title FROM books
WHERE id IN (
    SELECT book_id FROM authored
    WHERE author_id = (
        SELECT id FROM authors
        WHERE name = "Fernanda Melchor"
    )
);

CREATE VIEW "longlist" AS
SELECT name, title FROM authors
JOIN authored ON authors.id = authored.author_id
JOIN books ON books.id = authored.book_id;

SELECT title FROM longlist
WHERE name = "Fernanda Melchor";

SELECT book_id, ROUND(AVG(rating), 2) AS "rating" FROM ratings
GROUP BY book_id;

select book_id, title, year, round(avg(rating), 2) as rating from ratings
join books on books.id = ratings.book_id
group by book_id;

CREATE VIEW "average_book_ratings" AS
SELECT book_id, title, year, ROUND(AVG(rating), 2) AS rating FROM ratings
JOIN books ON books.id = ratings.book_id
GROUP BY book_id;

SELECT year, ROUND(AVG(rating), 2) AS 'rating' FROM average_book_ratings
GROUP BY year;

CREATE TEMPORARY VIEW "average_ratings_by_year" AS
SELECT year, ROUND(AVG(rating), 2) AS 'rating' FROM average_book_ratings
GROUP BY year;

DROP VIEW average_book_ratings;

WITH average_book_ratings AS (
    SELECT book_id, title, year, ROUND(AVG(rating), 2) AS rating FROM ratings
    JOIN books ON books.id = ratings.book_id
    GROUP BY book_id
)
SELECT year, ROUND(AVG(rating), 2) AS rating FROM average_book_ratings
GROUP BY year;

CREATE VIEW "2022" AS
SELECT id, title FROM books
WHERE year = 2022;
