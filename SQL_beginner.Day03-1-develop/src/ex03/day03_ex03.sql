(SELECT pizzeria.name AS pizzeria_name
FROM person  
INNER JOIN person_visits  ON person.id = person_visits.person_id
INNER JOIN pizzeria  ON pizzeria.id = person_visits.pizzeria_id
WHERE person.gender = 'female'
EXCEPT ALL
SELECT pizzeria.name
FROM person  
INNER JOIN person_visits ON person.id = person_visits.person_id
INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
WHERE person.gender = 'male')
UNION ALL
(SELECT pizzeria.name
FROM person 
INNER JOIN person_visits ON person.id = person_visits.person_id
INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
WHERE person.gender = 'male'
EXCEPT ALL
SELECT pizzeria.name
FROM person 
INNER JOIN person_visits ON person.id = person_visits.person_id
INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
WHERE person.gender = 'female')
ORDER BY pizzeria_name;