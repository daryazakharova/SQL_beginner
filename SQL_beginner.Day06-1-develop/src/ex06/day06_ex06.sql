CREATE SEQUENCE seq_person_discounts 
MINVALUE 1
START WITH 1;

ALTER TABLE person_discounts ALTER column id SET DEFAULT nextval('seq_person_discounts');

SELECT setval('seq_person_discounts', (SELECT COUNT(*)+1 FROM person_discounts));