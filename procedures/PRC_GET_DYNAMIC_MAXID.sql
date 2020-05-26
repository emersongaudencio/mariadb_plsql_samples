SET SESSION sql_mode=ORACLE;
DELIMITER /
CREATE OR REPLACE PROCEDURE PRC_GET_DYNAMIC_MAXID(p_owner IN VARCHAR2,
                                   p_table     IN VARCHAR2,
                                   p_attribute IN VARCHAR2,
                                   p_condition IN VARCHAR2,
                                   p_maxID IN OUT NUMBER) IS
      v_table VARCHAR2(100);
      v_sql VARCHAR2(100);
      v_maxID  NUMBER := 0;
   BEGIN
      v_table := p_owner || '.' || p_table;
      IF TRIM(p_condition) IS NOT NULL
      THEN
         v_sql := 'SELECT MAX(' || TRIM(p_attribute) || ') into @v_maxID' || ' FROM ' || v_table || ' WHERE ' || p_condition;
         EXECUTE IMMEDIATE v_sql;
      ELSE
         v_sql := 'SELECT MAX(' || TRIM(p_attribute) || ') into @v_maxID' || ' FROM ' || v_table;
         EXECUTE IMMEDIATE v_sql;
      END IF;
      p_maxID := @v_maxID;
   EXCEPTION
      WHEN OTHERS THEN
        null;
   END;
/
DELIMITER ;

--DBMS_OUTPUT.put_line('PRC_GET_MAXID_DINAMICO ' || v_table);

SET SESSION sql_mode=ORACLE;
DELIMITER /
BEGIN
 set @v_maxID = 0;
 PRC_GET_DYNAMIC_MAXID('emp100','salaries','emp_no','',@v_maxID);
 select @v_maxID;
END;
/
DELIMITER ;
