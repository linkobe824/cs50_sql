-- SELECT "name", "graduation_rates"."graduated" FROM "schools"
-- JOIN "graduation_rates" ON "schools"."id" = "graduation_rates"."school_id";

-- SELECT "name", "expenditures"."per_pupil_expenditure" FROM "schools"
-- JOIN "expenditures" ON "expenditures"."district_id" = "schools"."district_id";

SELECT "name", "expenditures"."per_pupil_expenditure", "graduation_rates"."graduated" FROM "schools"
JOIN "expenditures" ON "expenditures"."district_id" = "schools"."district_id"
JOIN "graduation_rates" ON "schools"."id" = "graduation_rates"."school_id"
ORDER BY "per_pupil_expenditure" DESC, "name";