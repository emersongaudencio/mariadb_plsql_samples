SET SESSION sql_mode=ORACLE;

-- Example of Package DBMS_OUTPUT
DELIMITER /

BEGIN
  DBMS_OUTPUT.PUT_LINE('Hello world from MariaDB DBMS_OUTPUT.PUT_LINE!');
END;
/

DELIMITER ;

-- Example of simple select
DELIMITER /

BEGIN
  SELECT 'Hello world from MariaDB anonymous PL/SQL block!' from dual;
END;
/

DELIMITER ;

-- Example of using Execute immediate
DELIMITER /

BEGIN
  EXECUTE IMMEDIATE 'BEGIN SELECT 1 from dual; END;';
END;
/

DELIMITER ;

-- Example of using FOR LOOP
DELIMITER /

BEGIN
  FOR rc1 IN (SELECT count(1) as cnt FROM emp1.salaries) LOOP
    DBMS_OUTPUT.PUT_LINE('The number of employes is '||rc1.cnt);
  END LOOP;
END;
/

DELIMITER ;

DELIMITER /
DECLARE
  v_row_salaries sample.salaries%ROWTYPE;
BEGIN
  For rc1 in (SELECT * FROM emp1.salaries limit 1000) LOOP
    v_row_salaries.emp_no := rc1.emp_no;
    v_row_salaries.salary := rc1.salary;
    v_row_salaries.from_date := rc1.from_date;
    v_row_salaries.to_date := rc1.to_date;
    INSERT INTO sample.salaries VALUES (v_row_salaries.emp_no,v_row_salaries.salary,v_row_salaries.from_date,v_row_salaries.to_date);
  END LOOP;
END;
/
DELIMITER ;

--insert into salaries values v_row_salaries;
(root@localhost) MariaDB [sample]> desc salaries;
+-----------+---------+------+-----+---------+-------+
| Field     | Type    | Null | Key | Default | Extra |
+-----------+---------+------+-----+---------+-------+
| emp_no    | int(11) | NO   | PRI | NULL    |       |
| salary    | int(11) | NO   |     | NULL    |       |
| from_date | date    | NO   | PRI | NULL    |       |
| to_date   | date    | NO   |     | NULL    |       |
+-----------+---------+------+-----+---------+-------+
