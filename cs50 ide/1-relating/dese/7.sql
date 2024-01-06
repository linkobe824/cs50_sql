-- DESE is preparing a report on schools in the Cambridge school district.
-- In 7.sql, write a SQL query to find the names of all schools in the Cambridge school district.

SELECT schools.name FROM schools
JOIN districts ON districts.id == schools.district_id
WHERE districts.name == "Cambridge";
