CREATE UNIQUE INDEX idx_menu_unique
    ON menu(pizzeria_id, pizza_name);

SET enable_seqscan TO OFF;

EXPLAIN (ANALYZE) SELECT *
FROM menu
WHERE pizzeria_id = 4 AND pizza_name = 'pepperoni pizza';