SELECT menu.pizza_name, menu.price, pizzeria.name AS pizzeria_name, person_visits.visit_date 
FROM menu 
INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
INNER JOIN person_visits ON	menu.pizzeria_id = person_visits.pizzeria_id	
INNER JOIN person ON person.id = person_visits.person_id
WHERE person.name = 'Kate' AND price BETWEEN 800 AND 1000
ORDER BY menu.pizza_name, menu.price,pizzeria_name;