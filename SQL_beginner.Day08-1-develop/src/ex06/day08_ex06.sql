-- Session 1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Session 2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Session 1
SELECT SUM(rating) FROM pizzeria;

-- Session 2
UPDATE pizzeria SET rating = 5.0 WHERE name = 'Pizza Hut';
COMMIT;

-- Session 1
SELECT SUM(rating) FROM pizzeria;
COMMIT;
SELECT SUM(rating) FROM pizzeria;

-- Session 2
SELECT SUM(rating) FROM pizzeria;
