SELECT name 
FROM person 
INNER JOIN person_order ON 	person.id = person_order.person_id
INNER JOIN menu ON person_order.menu_id = menu.id
WHERE  person.gender= 'male' AND person.address IN ('Moscow', 'Samara')
AND menu.pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY name DESC;