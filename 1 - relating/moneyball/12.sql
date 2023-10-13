SELECT "first_name", "last_name" FROM (
    SELECT "first_name", "last_name", "ID" FROM (
        SELECT "first_name", "last_name", "players"."id" AS "ID" FROM "players"
        JOIN "salaries" ON "salaries"."player_id" = "players"."id" 
        AND "salaries"."year" = 2001
        JOIN "performances" ON "performances"."player_id" = "salaries"."player_id" 
        AND "performances"."year" = 2001 AND "performances"."H" > 0
        ORDER BY "salaries"."salary"/"performances"."H", "players"."first_name", "players"."last_name" LIMIT 10
    )
    INTERSECT
    SELECT "first_name", "last_name", "ID" FROM (
        SELECT "first_name", "last_name", "players"."id" AS "ID" FROM "players"
        JOIN "salaries" ON "salaries"."player_id" = "players"."id" 
        AND "salaries"."year" = 2001
        JOIN "performances" ON "performances"."player_id" = "salaries"."player_id" 
        AND "performances"."year" = 2001 AND "performances"."RBI" > 0
        ORDER BY "salaries"."salary"/"performances"."RBI", "players"."first_name", "players"."last_name" LIMIT 10
    )
) AS "report"
ORDER BY "report"."ID";
