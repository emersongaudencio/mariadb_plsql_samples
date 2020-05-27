SET SESSION sql_mode=ORACLE;
DELIMITER /
CREATE OR REPLACE PROCEDURE PRC_DYNAMIC_TRUNCATE_TABLE(p_schema IN VARCHAR2, p_table IN VARCHAR2) IS
      v_table VARCHAR2(100);
      v_sql VARCHAR2(100);
   BEGIN
      v_table := p_schema || '.' || p_table;
      IF TRIM(p_schema) IS NOT NULL AND TRIM(p_table) IS NOT NULL
      THEN
        SET foreign_key_checks=0;
        v_sql := 'TRUNCATE TABLE ' || v_table;
        EXECUTE IMMEDIATE v_sql;
        SET foreign_key_checks=1;
      END IF;
   EXCEPTION
      WHEN OTHERS THEN
        null;
   END;
/
DELIMITER ;

SET SESSION sql_mode=ORACLE;
DELIMITER /
BEGIN
 PRC_DYNAMIC_TRUNCATE_TABLE('sample','salaries');
END;
/
DELIMITER ;


SET SESSION sql_mode=ORACLE;
DELIMITER /
BEGIN
 FOR RC_SCHEMAS IN (SELECT TABLE_SCHEMA, TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'emp2' AND TABLE_TYPE = 'BASE TABLE') LOOP
 PRC_DYNAMIC_TRUNCATE_TABLE(RC_SCHEMAS.TABLE_SCHEMA,RC_SCHEMAS.TABLE_NAME);
 END LOOP;
END;
/
DELIMITER ;
