VALUES TRUE;
-- COL1: TRUE

VALUES FALSE;
-- COL1: FALSE

VALUES UNKNOWN;
-- COL1: UNKNOWN

CREATE TABLE foo (x BOOLEAN);
INSERT INTO foo (x) VALUES (NULL);
INSERT INTO foo (x) VALUES (UNKNOWN);
INSERT INTO foo (x) VALUES (TRUE);
INSERT INTO foo (x) VALUES (FALSE);
SELECT * FROM foo;
-- msg: CREATE TABLE 1
-- msg: INSERT 1
-- msg: INSERT 1
-- msg: INSERT 1
-- msg: INSERT 1
-- X: UNKNOWN
-- X: UNKNOWN
-- X: TRUE
-- X: FALSE

VALUES TRUE AND TRUE;
-- COL1: TRUE

VALUES FALSE AND TRUE;
-- COL1: FALSE

VALUES UNKNOWN AND TRUE;
-- COL1: UNKNOWN

VALUES TRUE AND FALSE;
-- COL1: FALSE

VALUES FALSE AND FALSE;
-- COL1: FALSE

VALUES UNKNOWN AND FALSE;
-- COL1: FALSE

VALUES TRUE AND UNKNOWN;
-- COL1: UNKNOWN

VALUES FALSE AND UNKNOWN;
-- COL1: FALSE

VALUES UNKNOWN AND UNKNOWN;
-- COL1: UNKNOWN

VALUES TRUE OR TRUE;
-- COL1: TRUE

VALUES FALSE OR TRUE;
-- COL1: TRUE

VALUES UNKNOWN OR TRUE;
-- COL1: TRUE

VALUES TRUE OR FALSE;
-- COL1: TRUE

VALUES FALSE OR FALSE;
-- COL1: FALSE

VALUES UNKNOWN OR FALSE;
-- COL1: UNKNOWN

VALUES TRUE OR UNKNOWN;
-- COL1: TRUE

VALUES FALSE OR UNKNOWN;
-- COL1: UNKNOWN

VALUES UNKNOWN OR UNKNOWN;
-- COL1: UNKNOWN

VALUES TRUE IS TRUE;
-- COL1: TRUE

VALUES FALSE IS TRUE;
-- COL1: FALSE

VALUES UNKNOWN IS TRUE;
-- COL1: FALSE

VALUES TRUE IS FALSE;
-- COL1: FALSE

VALUES FALSE IS FALSE;
-- COL1: TRUE

VALUES UNKNOWN IS FALSE;
-- COL1: FALSE

VALUES TRUE IS UNKNOWN;
-- COL1: FALSE

VALUES FALSE IS UNKNOWN;
-- COL1: FALSE

VALUES UNKNOWN IS UNKNOWN;
-- COL1: TRUE

VALUES TRUE IS NULL;
-- COL1: FALSE

VALUES FALSE IS NULL;
-- COL1: FALSE

VALUES UNKNOWN IS NULL;
-- COL1: FALSE

VALUES TRUE IS NOT TRUE;
-- COL1: FALSE

VALUES FALSE IS NOT TRUE;
-- COL1: TRUE

VALUES UNKNOWN IS NOT TRUE;
-- COL1: TRUE

VALUES TRUE IS NOT FALSE;
-- COL1: TRUE

VALUES FALSE IS NOT FALSE;
-- COL1: FALSE

VALUES UNKNOWN IS NOT FALSE;
-- COL1: TRUE

VALUES TRUE IS NOT UNKNOWN;
-- COL1: TRUE

VALUES FALSE IS NOT UNKNOWN;
-- COL1: TRUE

VALUES UNKNOWN IS NOT UNKNOWN;
-- COL1: FALSE

VALUES TRUE IS NOT NULL;
-- COL1: TRUE

VALUES FALSE IS NOT NULL;
-- COL1: TRUE

VALUES UNKNOWN IS NOT NULL;
-- COL1: TRUE

VALUES NOT TRUE;
-- COL1: FALSE

VALUES NOT FALSE;
-- COL1: TRUE

VALUES NOT UNKNOWN;
-- COL1: UNKNOWN
