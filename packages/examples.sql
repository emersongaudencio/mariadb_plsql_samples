SET SESSION sql_mode=ORACLE;
DELIMITER /

CREATE OR REPLACE PACKAGE hello AS
  -- must be delared as public!
  PROCEDURE helloWorldProcedure(pString VARCHAR2);
  FUNCTION helloWorldFunction(pString VARCHAR2) RETURN VARCHAR2;
END hello;
/

CREATE OR REPLACE PACKAGE BODY hello AS

  vString VARCHAR2(255) := NULL;

  -- was declared public in PACKAGE
  PROCEDURE helloWorldProcedure(pString VARCHAR2) AS
  BEGIN
    SELECT 'Hello world from MariaDB Package Procedure in ' || pString || '!' INTO vString FROM dual;
    SELECT vString;
  END;

  -- was declared public in PACKAGE
  FUNCTION helloWorldFunction(pString VARCHAR2) RETURN VARCHAR2 AS
  BEGIN
    SELECT 'Hello world from MariaDB Package Function in ' || pString || '!' INTO vString FROM dual;
    return vString;
  END;
BEGIN
  SELECT 'Package initialiser, called only once per connection!';
END hello;
/

DECLARE
  vString VARCHAR2(255) := NULL;
  -- CONSTANT seems to be not supported yet by MariaDB
  -- cString CONSTANT VARCHAR2(255) := 'anonymous block';
  cString VARCHAR2(255) := 'anonymous block';
BEGIN
  CALL hello.helloWorldProcedure(cString);
  SELECT hello.helloWorldFunction(cString) INTO vString;
  SELECT vString;
END;
/

DELIMITER ;
