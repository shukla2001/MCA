SET serveroutput ON;
DECLARE
  nos NUMBER := &no;
  sum_of_digits NUMBER := 0;
  digit NUMBER;
BEGIN
  WHILE nos > 0 LOOP
    digit := MOD(nos, 10);
    sum_of_digits := sum_of_digits + digit;
    nos := FLOOR(nos / 10); 
  END LOOP;
  DBMS_OUTPUT.put_line('Sum of Digits = ' || sum_of_digits);
END;
/
