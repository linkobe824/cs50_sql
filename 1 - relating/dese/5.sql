SELECT "city", COUNT("city") AS "Quantity" FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
HAVING "Quantity" <= 3
ORDER BY "Quantity" DESC, "city";