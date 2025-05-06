COMMENT ON TABLE person_discounts IS 'Personal discounts for people';

COMMENT ON COLUMN person_discounts.id IS 'Id attribute like a Primary Key';

COMMENT ON COLUMN person_discounts.person_id IS 'Person identifier attribute';

COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Pizzeria identifier attribute';

COMMENT ON COLUMN person_discounts.discount IS 'Discount attribute for person and pizzeria';