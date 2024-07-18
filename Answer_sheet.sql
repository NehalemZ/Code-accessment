CREATE FUNCTION sltin(in_string varchar(50)) RETURNS varchar(50)DETERMINISTIC READS SQL DATA
BEGIN
DECLARE output_str varchar(50) DEFAULT '';
SET output_str = if(instr(in_string,'.') >0, truncate( regexp_substr(in_string, '[0-9.]+'),2), concat(cast(regexp_substr(in_string, '[0-9.]+') AS char),'.00'));
RETURN output_str ;
END ;
SELECT sltin('abcd123.456'), sltin('abcd123') FROM DUAL;
