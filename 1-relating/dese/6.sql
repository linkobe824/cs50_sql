-- DESE wants to assess which schools achieved a 100% graduation rate.
-- In 6.sql, write a SQL query to find the names of schools (public or charter!) that reported a 100% graduation rate.

SELECT name FROM schools
JOIN graduation_rates ON graduation_rates.school_id == schools.id
WHERE graduation_rates.graduated == 100;
