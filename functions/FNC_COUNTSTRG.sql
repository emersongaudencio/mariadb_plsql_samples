SET SESSION sql_mode=ORACLE;
DELIMITER /
CREATE OR REPLACE FUNCTION FNC_COUNTSTRG(p_list VARCHAR2, p_delimiter VARCHAR2) RETURN NUMBER AS
BEGIN
  DECLARE
  vLongitude NUMBER(10);
  vCount  NUMBER := 0;
  vChar   VARCHAR2(1);
BEGIN
  vLongitude := length(p_list);
  FOR i IN 1 .. vLongitude
  LOOP
     vChar := Substr(p_list, i, 1);
     IF vChar = p_delimiter
     THEN
        vCount := vCount + 1;
     END IF;
  END LOOP;
  RETURN vCount;
  EXCEPTION
  WHEN OTHERS THEN
     RETURN vCount;
END;
END;
/
DELIMITER ;
