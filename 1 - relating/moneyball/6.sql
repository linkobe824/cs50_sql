SELECT "name", SUM("performances"."H") AS "total hits 2001" FROM "teams"
JOIN "performances" ON "performances"."team_id" = "teams"."id"
WHERE "performances"."year" = 2001
GROUP BY "teams"."name"
ORDER BY "total hits 2001" DESC LIMIT 5;