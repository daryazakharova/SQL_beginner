SELECT result.name, COUNT(*) AS total_count
FROM (SELECT person_visits.pizzeria_id, pizzeria.name
	FROM person_visits
	LEFT JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
	UNION ALL
	SELECT menu.pizzeria_id, pizzeria.name
	FROM person_order
	LEFT JOIN menu ON person_order.menu_id = menu.id	
	LEFT JOIN pizzeria ON menu.pizzeria_id = pizzeria.id) AS result
GROUP BY result.pizzeria_id, result.name	
ORDER BY total_count DESC;