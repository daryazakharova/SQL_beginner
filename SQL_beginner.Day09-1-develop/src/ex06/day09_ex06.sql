CREATE FUNCTION fnc_person_visits_and_eats_on_date(pperson varchar DEFAULT 'Dmitriy', 
pprice numeric DEFAULT 500, pdate date DEFAULT '2022-01-08')
RETURNS TABLE(name varchar) AS $$
    BEGIN
    RETURN QUERY
    SELECT p.name AS pizzeria_name
    FROM menu m
    JOIN pizzeria p 
        ON p.id = m.pizzeria_id
    JOIN person_visits pv 
        ON m.pizzeria_id = pv.pizzeria_id
    JOIN person pr 
        ON pr.id = pv.person_id
    WHERE price < pprice AND pr.name = pperson AND visit_date = pdate;
END;
$$
LANGUAGE  plpgsql;

SELECT * FROM fnc_person_visits_and_eats_on_date(pprice := 800);
SELECT * FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
