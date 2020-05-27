CREATE SEQUENCE id START WITH 100 INCREMENT BY 1;

SHOW CREATE SEQUENCE id\G
*************************** 1. row ***************************
       Table: id
Create Table: CREATE SEQUENCE `id` start with 100 minvalue 1 maxvalue 9223372036854775806
  increment by 1 cache 1000 nocycle ENGINE=InnoDB

Using Sequence Objects
To get the next value from a sequence, use

NEXT VALUE FOR sequence_name
or

NEXTVAL(sequence_name)
or in Oracle mode (SQL_MODE=ORACLE)

sequence_name.nextval
For retrieving the last value used by the current connection from a sequence use:

PREVIOUS VALUE FOR sequence_name
or
LASTVAL(sequence_name)

or in Oracle mode (SQL_MODE=ORACLE)
sequence_name.currval

For example:

SELECT NEXTVAL(s);
+------------+
| NEXTVAL(s) |
+------------+
|        100 |
+------------+

SELECT NEXTVAL(s);
+------------+
| NEXTVAL(s) |
+------------+
|        110 |
+------------+

SELECT LASTVAL(s);
+------------+
| LASTVAL(s) |
+------------+
|        110 |
+------------+

Using Sequences in DEFAULT

MariaDB starting with 10.3.3
Starting from 10.3.3 you can use Sequences in DEFAULT:

create sequence s1;
create table t1 (a int primary key default (next value for s1), b int);
insert into t1 (b) values (1),(2);
select * from t1;
+---+------+
| a | b    |
+---+------+
| 1 |    1 |
| 2 |    2 |
+---+------+

Changing a Sequence
The ALTER SEQUENCE statement is used for changing sequences. For example, to restart the sequence at another value:

ALTER SEQUENCE s RESTART 50;

SELECT NEXTVAL(s);
+------------+
| NEXTVAL(s) |
+------------+
|         50 |
+------------+

The SETVAL function can also be used to set the next value to be returned for a SEQUENCE, for example:

SELECT SETVAL(s, 100);
+----------------+
| SETVAL(s, 100) |
+----------------+
|            100 |
+----------------+

SETVAL can only be used to increase the sequence value. Attempting to set a lower value will fail, returning NULL:

SELECT SETVAL(s, 50);
+---------------+
| SETVAL(s, 50) |
+---------------+
|          NULL |
+---------------+

Dropping a Sequence
The DROP SEQUENCE statement is used to drop a sequence, for example:

DROP SEQUENCE s;
