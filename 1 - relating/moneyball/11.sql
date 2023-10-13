SELECT "first_name", "last_name", "salaries"."salary"/"performances"."H" AS "dollars per hit" 
FROM "players"
JOIN "salaries" ON "salaries"."player_id" = "players"."id" 
AND "salaries"."year" = 2001
JOIN "performances" ON "performances"."player_id" = "salaries"."player_id" 
AND "performances"."year" = 2001 AND "performances"."H" > 0
ORDER BY "dollars per hit", "players"."first_name", "players"."last_name" LIMIT 10;
