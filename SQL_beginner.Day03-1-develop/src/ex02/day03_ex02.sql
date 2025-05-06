SELECT menu.pizza_name, menu.price, pizzeria.name AS pizzeria_name
FROM (
SELECT id AS menu_id 
FROM menu 
EXCEPT
SELECT menu_id 
FROM person_order	
) AS id_menu
INNER JOIN menu ON id_menu.menu_id = menu.id
INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id	
ORDER BY menu.pizza_name, menu.price;