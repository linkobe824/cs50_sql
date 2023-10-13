SELECT "name", "expenditures"."pupils" FROM "districts"
JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id" 
ORDER BY "pupils" DESC LIMIT 10;
