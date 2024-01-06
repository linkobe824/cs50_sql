-- Another parent wants to send their child to a district with few other students.
-- In 9.sql, write a SQL query to find the name (or names) of the school district(s) with the single least number of pupils. Report only the name(s).

SELECT name FROM districts
JOIN expenditures ON expenditures.district_id == districts.id
WHERE expenditures.pupils == (
    SELECT pupils FROM expenditures
    ORDER BY pupils ASC LIMIT 1
);
