CREATE TABLE person_audit(
created timestamp with time zone DEFAULT current_timestamp NOT NULL, 
type_event char(1)  DEFAULT 'I' NOT NULL,
row_id bigint NOT NULL,
name varchar, 
age integer, 
gender varchar,
address varchar,
CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D'))
);

--триггерная функция fnc_trg_person_insert_audit
CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
  RETURNS trigger AS
$$
BEGIN
INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
VALUES(current_timestamp,'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

--триггер trg_person_insert_audit вызывает триггерную функцию	
CREATE TRIGGER trg_person_insert_audit 
AFTER  INSERT 
ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) 
VALUES (10,'Damir', 22, 'male', 'Irkutsk');

SELECT * From person_audit;