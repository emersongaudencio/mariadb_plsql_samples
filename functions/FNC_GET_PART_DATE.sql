SET SESSION sql_mode=ORACLE;
DELIMITER /
CREATE OR REPLACE FUNCTION FNC_GET_PART_DATE(p_date DATE, p_condition VARCHAR2) RETURN VARCHAR2 IS
   v_part_date VARCHAR2(5);
   -- "D" for day
   -- "M" for month
   -- "Y" for year
BEGIN
   v_part_date := CASE p_condition
                      WHEN 'D' THEN
                       extract(DAY FROM(p_date))
                      WHEN 'M' THEN
                       extract(MONTH FROM(p_date))
                      WHEN 'Y' THEN
                       extract(YEAR FROM(p_date))
                   END;
   RETURN v_part_date;
EXCEPTION
   WHEN OTHERS THEN
      RETURN 0;
END;
/
DELIMITER ;
