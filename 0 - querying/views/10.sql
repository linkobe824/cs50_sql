SELECT "artist", "english_title" AS "Top Complex Prints in mid brightness", "entropy", "brightness" FROM "views"
WHERE "brightness" BETWEEN 0.5 AND 0.6
ORDER BY "entropy" DESC LIMIT 5;
