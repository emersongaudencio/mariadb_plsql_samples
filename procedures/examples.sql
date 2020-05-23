SET SESSION sql_mode=ORACLE;
DELIMITER /

CREATE OR REPLACE PROCEDURE hello AS
BEGIN
  DECLARE
    vString VARCHAR2(255) := NULL;
  BEGIN
    SELECT 'Hello world from MariaDB PL/SQL Procedure!' INTO vString FROM dual;
    SELECT vString;
  END;
END hello;
/

BEGIN
  hello();
END;
/

DELIMITER ;
