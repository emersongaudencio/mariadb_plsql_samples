TEST CASES
=============
1) created procedure as oracle syntax  is working fine

example
 set sql_mode='STRICT_TRANS_TABLES';
 set sql_mode='ORACLE';
CREATE PROCEDURE sp1 (p1 IN VARCHAR2, p2 OUT VARCHAR2)
IS

  v1 VARCHAR2(100);

BEGIN

  v1 := p1;

  p2 := v1;

END;
 out put : success


 1) 1. [DONE] Labels

 set sql_mode='STRICT_TRANS_TABLES';
DELIMITER /
CREATE or replace PROCEDURE doiterate(p1 INT)
BEGIN
  label1: LOOP
    SET p1 = p1 + 1;
    IF p1 < 10 THEN ITERATE label1; END IF;
    LEAVE label1;
  END LOOP label1;
END;
/

DELIMITER ;


=======================================================================================================================================================================
 2) Different order of IN, OUT, INOUT keywords
 Oracle:
 ---------------
 set sql_mode='ORACLE';
delimiter /
CREATE or replace FUNCTION f11 RETURN NUMBER

AS

BEGIN

  RETURN 10;

END;
/
delimiter ;

mariadb
------------------------
set sql_mode='STRICT_TRANS_TABLES';
DELIMITER //

CREATE procedure CalcValue ( OUT ending_value INT )
DETERMINISTIC

BEGIN

   DECLARE total_value INT;

   SET total_value = 50;

   label1: WHILE total_value <= 3000 DO
     SET total_value = total_value * 2;
   END WHILE label1;

   SET ending_value = total_value;

END; //

DELIMITER ;
CALL CalcValue (@variable_name);
SELECT @variable_name;


TEST 4)  [DONE] AS/IS keyword before a function or a procedure body


Examples ;
set sql_mode='ORACLE';
delimiter /
CREATE or replace PROCEDURE sp11 (p1 IN VARCHAR2(20), p2 OUT VARCHAR2(30))

IS

 BEGIN
select 12;
 END;
 /
 delimiter ;

delimiter /
CREATE FUNCTION f123 RETURN NUMBER

AS

BEGIN

  RETURN 10;

END;

/
delimiter ;


DELIMITER //



5. [DONE] EXIT statement

In ORACLE
---------------------------
set sql_mode='ORACLE';

DELIMITER /

CREATE or replace function fn_loop( p_till int) RETURN int
IS
	l_cnt int := 0;
	l_cnt1 int := 0;
BEGIN
	loop
		if l_cnt = p_till then
				exit;
		end if;

		l_cnt := l_cnt + 1;

	end loop;

	RETURN l_cnt;
END;
/

DELIMITER ;

In Maria
------------------
set sql_mode='STRICT_TRANS_TABLES';
delimiter $$
CREATE PROCEDURE proc(IN p TINYINT)
`whole_proc`:
BEGIN
	SELECT 1;
	IF p < 1 THEN
		LEAVE `whole_proc`;
	END IF;
	SELECT 2;
END;
$$
delimiter ;
CALL proc(0);
==================================================================================================================================================================
6. [DONE] Assignment operator & 7. [DONE] Variable declarations
In Maria
------------
set sql_mode='STRICT_TRANS_TABLES';
 drop procedure proc;
delimiter $$
create PROCEDURE proc()
`whole_proc`:
BEGIN
declare var int;
SET var= 10;
select var;
END;
$$
delimiter ;
CALL proc();

In ORACLE
--------------------
set sql_mode='ORACLE';
delimiter $$
create PROCEDURE proco()
as
 var int;
BEGIN

 var:= 10;
select var;
END;
$$
delimiter ;
CALL proco();
====================================================================================================
8. [DEREFFED] Anonymous blocks

set sql_mode='ORACLE';
delimiter /
DECLARE
   Emp_name    VARCHAR2(10);
   Cursor      c1 IS SELECT Ename FROM Emp_tab
                  WHERE Deptno = 20;
BEGIN
   OPEN c1;
   LOOP
      FETCH c1 INTO Emp_name;
      EXIT WHEN c1%NOTFOUND;
      select 1;
   END LOOP;
END;

delimiter ;
========================================================================================================
9. [DONE] EXCEPTION handlers
exp:
In Maria
--------------
CREATE TABLE t (s1 INT, PRIMARY KEY (s1));

DELIMITER //

CREATE PROCEDURE handlerdemo ()
     BEGIN
       DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SET @x2 = 1;
       SET @x = 1;
       INSERT INTO t VALUES (1);
       SET @x = 2;
       INSERT INTO t VALUES (1);
       SET @x = 3;
     END;
     //

DELIMITER ;

CALL handlerdemo();


In ORACLE
-----------------------
set sql_mode='ORACLE';
delimiter /
DECLARE
   Emp_name    VARCHAR2(10);
   Cursor      c1 IS SELECT Ename FROM Emp_tab
                  WHERE Deptno = 20;
BEGIN
   OPEN c1;
   LOOP
      FETCH c1 INTO Emp_name;
      EXIT WHEN c1%NOTFOUND;
      select 1;
   END LOOP;
END;

delimiter ;
============================================================================================================================================

10  [DONE] Default variable value: x INT := 10;
example:
set sql_mode='ORACLE';

delimiter /
create or replace procedure dfv()
as
a NUMBER(10) := 10;
BEGIN

  select a;
END;
/
delimiter ;

call dfv();

==============================================================================================================
 11. [DONE] NULL as a statement
exp :
set sql_mode='ORACLE';

delimiter /


CREATE or replace PROCEDURE p1() AS

BEGIN
END;
/
delimiter ;

call p1();
result is fail
===================================================================================================================================================
12. [DONE] No parentheses if no arguments

set sql_mode='ORACLE';

delimiter /


CREATE OR REPLACE FUNCTION text_length
   RETURN NUMBER
   as
	BEGIN
  RETURN 1;
END;
/
delimiter ;

===========================================================================================================================================================

13. [DONE] RETURN vs RETURNS
In Maria
---------------
set sql_mode='STRICT_TRANS_TABLES';

delimiter /


CREATE OR REPLACE  FUNCTION text_length1()
   RETURNS int
    	BEGIN
  RETURN 1;
END;
/
delimiter ;

In ORACLE
--------------

set sql_mode='ORACLE';

delimiter /


CREATE OR REPLACE FUNCTION text_length
   RETURN NUMBER
   as
	BEGIN
  RETURN 1;
END;
/
delimiter ;
===============================================================================================================================================================
14. [DONE] IN OUT instead of INOUT

In ORACLE
---------------------
set sql_mode='oracle';

delimiter /

CREATE PROCEDURE p12 (a IN OUT INT)

AS

BEGIN

END;

/
delimiter ;


In Maria
----------------------
set sql_mode='STRICT_TRANS_TABLES';
delimiter /

CREATE PROCEDURE p123 (INOUT a INt )

BEGIN

END;

/
delimiter ;

====================================================================================

15. [DONE] ELSIF vs ELSEIF
Exp:

In ORACLE
----------------------
set sql_mode='oracle';
-- set sql_mode='STRICT_TRANS_TABLES';
delimiter /
DROP FUNCTION f1;

CREATE FUNCTION f1(a INT) RETURN VARCHAR

AS

BEGIN

  IF a=1 THEN RETURN 'a is 1';

  ELSIF a=2 THEN RETURN 'a is 2';

  ELSE RETURN 'a is unknown';

  END IF;

END;

/
delimiter ;
SELECT f1(1) FROM DUAL;
================================================================================================================================================================
16. [DONE] Cursor declaration
In Maria
--------------
CREATE TABLE c1(i INT);

CREATE TABLE c2(i INT);

CREATE TABLE c3(i INT);

DELIMITER //

CREATE or replace PROCEDURE p1()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE x, y INT;
  DECLARE cur1 CURSOR FOR SELECT i FROM c1;
  DECLARE cur2 CURSOR FOR SELECT i FROM c2;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur1;
  OPEN cur2;

  read_loop: LOOP
    FETCH cur1 INTO x;
    FETCH cur2 INTO y;
    IF done THEN
      LEAVE read_loop;
    END IF;
    IF x < y THEN
      INSERT INTO c3 VALUES (x);
    ELSE
      INSERT INTO c3 VALUES (y);
    END IF;
  END LOOP;

  CLOSE cur1;
  CLOSE cur2;
END; //

DELIMITER ;

INSERT INTO c1 VALUES(5),(50),(500);

INSERT INTO c2 VALUES(10),(20),(30);

CALL p1;

SELECT * FROM c1;


In ORACLE
--------------
DROP TABLE t1;

CREATE TABLE t1 (a INT);
delimiter $$

create or replace procedure zingc()
as

begin
DECLARE

  CURSOR cr IS SELECT * FROM t1;

BEGIN

  NULL;

END;
end ;
$$
delimiter ;


================================================================================================================================
17. [DONE] RETURN in stored procedures
Exp:
set sql_mode='oracle';

delimiter $$
CREATE or replace PROCEDURE p1 (a IN OUT INT)

AS

BEGIN

  IF a < 10 THEN

    RETURN;

  END IF;

  a:=a+1;

EXCEPTION

  WHEN OTHERS THEN RETURN;

END;
$$
delimiter ;
==========================================================================================================
18. [DONE] WHILE syntax

In ORACLE
----------------

set sql_mode='ORACLE';

DELIMITER /
CREATE PROCEDURE dowhileo()
as
   v1 INT ;
BEGIN

v1:=5;
  WHILE v1 < 10
    LOOP
     v1 := v1 - 1;
  END LOOP;
END
/

DELIMITER ;






In Maria
----------------------
set sql_mode='STRICT_TRANS_TABLES';
DELIMITER /
CREATE or replace PROCEDURE dowhile()
BEGIN
  DECLARE v1 INT DEFAULT 5;

  WHILE v1 > 0 DO

    SET v1 = v1 - 1;
  END WHILE;
END
/

DELIMITER ;
================================================================================================================================================================
19. [DONE] CONTINUE statement

set sql_mode='ORACLE';

DELIMITER /

create or replace procedure pr_continue_test(p_grade CHAR)
is
	x int(10) := 0;
BEGIN
  LOOP
    select concat('Inside loop:  x = ',x);

    x := x + 1;

    IF x < 3 THEN
      CONTINUE;
    END IF;

	select concat('Inside loop, after CONTINUE:  x = ',x);

    EXIT WHEN x = 5;

  END LOOP;

 select concat('After loop:  x = ',x);

END;
/

DELIMITER ;
