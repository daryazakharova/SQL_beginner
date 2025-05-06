CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10)
RETURNS TABLE (Fibonacci_numbers integer) AS $$
WITH RECURSIVE fibonacci (first, second) AS 
    (SELECT 0 AS first, 1 AS second
    UNION ALL
    SELECT second, first+second
    FROM fibonacci
    WHERE second<pstop)
SELECT first
FROM fibonacci;
$$ LANGUAGE  SQL;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();