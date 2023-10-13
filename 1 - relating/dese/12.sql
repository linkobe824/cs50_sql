SELECT "name", "expenditures"."per_pupil_expenditure","staff_evaluations"."exemplary" FROM "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
JOIN "staff_evaluations" ON "districts"."id" = "staff_evaluations"."district_id"
WHERE "districts"."type" = 'Public School District' AND "staff_evaluations"."exemplary" NOT NULL
ORDER BY "staff_evaluations"."exemplary" DESC, "expenditures"."per_pupil_expenditure" DESC LIMIT 20;