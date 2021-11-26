SELECT * FROM (VALUES 1);
-- COL1: 1

EXPLAIN SELECT * FROM (VALUES 1);
-- EXPLAIN: VALUES (COL1 INTEGER) = ROW(1)

SELECT * FROM (VALUES 1, 'foo', TRUE);
-- COL1: 1 COL2: foo COL3: TRUE

EXPLAIN SELECT * FROM (VALUES 1, 'foo', TRUE);
-- EXPLAIN: VALUES (COL1 INTEGER, COL2 CHARACTER VARYING, COL3 BOOLEAN) = ROW(1, 'foo', TRUE)

SELECT * FROM (VALUES 1, 'foo', TRUE) AS t1 (abc, col2, "f");
-- ABC: 1 COL2: foo f: TRUE

EXPLAIN SELECT * FROM (VALUES 1, 'foo', TRUE) AS t1 (abc, col2, "f");
-- EXPLAIN: VALUES (ABC INTEGER, COL2 CHARACTER VARYING, f BOOLEAN) = ROW(1, 'foo', TRUE)

VALUES 'cool';
-- COL1: cool

VALUES 'cool', 12.3;
-- COL1: cool COL2: 12.3

EXPLAIN VALUES 'hello';
-- EXPLAIN: VALUES (COL1 CHARACTER VARYING) = ROW('hello')

EXPLAIN VALUES 'hello', 1.22;
-- EXPLAIN: VALUES (COL1 CHARACTER VARYING, COL2 DOUBLE PRECISION) = ROW('hello', 1.22)

SELECT * FROM (VALUES ROW(123), ROW(456));
-- COL1: 123
-- COL1: 456

EXPLAIN SELECT * FROM (VALUES ROW(123), ROW(456));
-- EXPLAIN: VALUES (COL1 INTEGER) = ROW(123), ROW(456)

SELECT * FROM (VALUES ROW(123, 'hi'), ROW(456, 'there'));
-- COL1: 123 COL2: hi
-- COL1: 456 COL2: there

EXPLAIN SELECT * FROM (VALUES ROW(123, 'hi'), ROW(456, 'there'));
-- EXPLAIN: VALUES (COL1 INTEGER, COL2 CHARACTER VARYING) = ROW(123, 'hi'), ROW(456, 'there')

SELECT * FROM (VALUES ROW(123, 'hi'), ROW(456, 'there')) AS foo (bar, baz);
-- BAR: 123 BAZ: hi
-- BAR: 456 BAZ: there

EXPLAIN SELECT *
FROM (VALUES ROW(123, 'hi'), ROW(456, 'there')) AS foo (bar, baz);
-- EXPLAIN: VALUES (BAR INTEGER, BAZ CHARACTER VARYING) = ROW(123, 'hi'), ROW(456, 'there')

SELECT * FROM (VALUES 1, 2) AS t1 (foo);
-- error 42601: syntax error: ROW provides the wrong number of columns for the correlation

SELECT * FROM (VALUES 1, 2) AS t1 (foo, bar, baz);
-- error 42601: syntax error: ROW provides the wrong number of columns for the correlation

SELECT * FROM (VALUES ROW(1, 2), ROW(3, 4)) AS t1 (foo, bar);
-- FOO: 1 BAR: 2
-- FOO: 3 BAR: 4

SELECT * FROM (VALUES ROW(1, 2), ROW(3, 4)) AS t1 (foo);
-- error 42601: syntax error: ROW provides the wrong number of columns for the correlation

SELECT * FROM (VALUES ROW(1), ROW(3, 4)) AS t1 (foo, bar);
-- error 42601: syntax error: ROW provides the wrong number of columns for the correlation

SELECT * FROM (VALUES ROW(1, 2), ROW(3, 4), ROW(5, 6)) AS t1 (foo, bar)
FETCH FIRST 2 ROWS ONLY;
-- FOO: 1 BAR: 2
-- FOO: 3 BAR: 4

SELECT * FROM (VALUES ROW(1, 2), ROW(3, 4), ROW(5, 6)) AS t1 (foo, bar)
OFFSET 1 ROW;
-- FOO: 3 BAR: 4
-- FOO: 5 BAR: 6

SELECT * FROM (VALUES ROW(1, 2), ROW(3, 4), ROW(5, 6)) AS t1 (foo, bar)
OFFSET 10 ROWS;