SELECT "name" FROM "schools"
WHERE "id" = (
    SELECT "school_id" FROM "graduation_rates"
    WHERE "graduated" = 100
);