SELECT "city", COUNT("city") AS "Quantity" FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
ORDER BY "Quantity" DESC LIMIT 10;