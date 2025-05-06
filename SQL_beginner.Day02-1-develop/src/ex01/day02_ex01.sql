SELECT missing_date::date 
FROM (SELECT * FROM person_visits po WHERE person_id IN (1,2)) AS pv 
RIGHT JOIN generate_series('2022-01-01','2022-01-10', interval '1 day') AS missing_date
ON pv.visit_date = missing_date
WHERE pv.id IS NULL
ORDER BY missing_date;