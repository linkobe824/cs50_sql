SELECT "teams"."name", ROUND(AVG("salary"), 2) AS "average salaries 2001" FROM "salaries"
JOIN "teams" ON "teams"."id" = "salaries"."team_id" AND "salaries"."year" = 2001
GROUP BY "team_id"
ORDER BY "average salaries 2001";
