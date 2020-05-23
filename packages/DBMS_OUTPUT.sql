DELIMITER /

CREATE OR REPLACE PACKAGE DBMS_OUTPUT AS
  PROCEDURE PUT_LINE(OUTPUT IN VARCHAR2);
END DBMS_OUTPUT;
/

CREATE OR REPLACE PACKAGE BODY DBMS_OUTPUT AS

  PROCEDURE PUT_LINE(OUTPUT IN VARCHAR2) AS
  BEGIN
    SELECT OUTPUT;
  END;
END DBMS_OUTPUT;
/

BEGIN
  DBMS_OUTPUT.PUT_LINE('Hello world from MariaDB DBMS_OUTPUT.PUT_LINE!');
END;
/

DELIMITER ;
