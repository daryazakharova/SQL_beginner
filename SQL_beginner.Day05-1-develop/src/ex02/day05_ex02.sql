CREATE INDEX idx_person_name
    ON person(UPPER(name));

SET enable_seqscan TO OFF;

EXPLAIN (ANALYZE) SELECT name
FROM person
ORDER BY (UPPER(name));