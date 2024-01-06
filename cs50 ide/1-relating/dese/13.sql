-- top 10 districts with the worst staff_evaluations
SELECT name, staff_evaluations.unsatisfactory FROM districts
JOIN staff_evaluations ON staff_evaluations.district_id == districts.id
ORDER BY staff_evaluations.unsatisfactory DESC LIMIT 10;
