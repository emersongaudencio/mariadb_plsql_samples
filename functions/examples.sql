SET SESSION sql_mode=ORACLE;
DELIMITER /

CREATE OR REPLACE FUNCTION hello RETURN VARCHAR2 DETERMINISTIC AS
BEGIN
  DECLARE
    vString VARCHAR2(255) := NULL;
  BEGIN
    SELECT 'Hello world from MariaDB PL/SQL Function!' INTO vString FROM dual;
    RETURN vString;
  END;
END hello;
/

DECLARE
  vString VARCHAR(255) := NULL;
BEGIN
  vString := hello();
  SELECT vString;
END;
/

DELIMITER ;
