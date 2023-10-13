SELECT "name", "expenditures"."per_pupil_expenditure" FROM "districts"
JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
ORDER BY "expenditures"."per_pupil_expenditure" DESC LIMIT 10;
