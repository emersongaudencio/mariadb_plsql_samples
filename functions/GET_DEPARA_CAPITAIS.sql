SET SESSION sql_mode=ORACLE;
DELIMITER /
CREATE OR REPLACE FUNCTION GET_DEPARA_CAPITAIS(p_sigla_estado VARCHAR2)
   RETURN VARCHAR2 IS
   V_SIGLA_CAPITAL  VARCHAR2(2) := TRIM(UPPER(p_sigla_estado));
   V_CIDADE_CAPITAL VARCHAR2(100);
BEGIN
   V_CIDADE_CAPITAL := CASE
                          WHEN V_SIGLA_CAPITAL = 'AC' THEN
                           'RIO BRANCO'
                          WHEN V_SIGLA_CAPITAL = 'AL' THEN
                           'MACEIÓ'
                          WHEN V_SIGLA_CAPITAL = 'AP' THEN
                           'MACAPÁ'
                          WHEN V_SIGLA_CAPITAL = 'AM' THEN
                           'MANAUS'
                          WHEN V_SIGLA_CAPITAL = 'BA' THEN
                           'SALVADOR'
                          WHEN V_SIGLA_CAPITAL = 'CE' THEN
                           'FORTALEZA'
                          WHEN V_SIGLA_CAPITAL = 'DF' THEN
                           'BRASÍLIA'
                          WHEN V_SIGLA_CAPITAL = 'GO' THEN
                           'GOIÂNIA'
                          WHEN V_SIGLA_CAPITAL = 'MA' THEN
                           'SÃO LUÍS'
                          WHEN V_SIGLA_CAPITAL = 'MT' THEN
                           'CUIABÁ'
                          WHEN V_SIGLA_CAPITAL = 'MS' THEN
                           'CAMPO GRANDE'
                          WHEN V_SIGLA_CAPITAL = 'MS' THEN
                           'CAMPO GRANDE'
                          WHEN V_SIGLA_CAPITAL = 'MG' THEN
                           'BELO HORIZONTE'
                          WHEN V_SIGLA_CAPITAL = 'PA' THEN
                           'BELÉM'
                          WHEN V_SIGLA_CAPITAL = 'PB' THEN
                           'JOÃO PESSOA'
                          WHEN V_SIGLA_CAPITAL = 'PR' THEN
                           'CURITIBA'
                          WHEN V_SIGLA_CAPITAL = 'PE' THEN
                           'RECIFE'
                          WHEN V_SIGLA_CAPITAL = 'PI' THEN
                           'TERESINA'
                          WHEN V_SIGLA_CAPITAL = 'PI' THEN
                           'TERESINA'
                          WHEN V_SIGLA_CAPITAL = 'RJ' THEN
                           'RIO DE JANEIRO'
                          WHEN V_SIGLA_CAPITAL = 'RN' THEN
                           'NATAL'
                          WHEN V_SIGLA_CAPITAL = 'RS' THEN
                           'PORTO ALEGRE'
                          WHEN V_SIGLA_CAPITAL = 'RO' THEN
                           'PORTO VELHO'
                          WHEN V_SIGLA_CAPITAL = 'RR' THEN
                           'BOA VISTA'
                          WHEN V_SIGLA_CAPITAL = 'SC' THEN
                           'FLORIANÓPOLIS'
                          WHEN V_SIGLA_CAPITAL = 'SP' THEN
                           'SÃO PAULO'
                          WHEN V_SIGLA_CAPITAL = 'SE' THEN
                           'ARACAJU'
                          WHEN V_SIGLA_CAPITAL = 'TO' THEN
                           'PALMAS'
                       END;
   RETURN V_CIDADE_CAPITAL;
END;
/
DELIMITER ;
