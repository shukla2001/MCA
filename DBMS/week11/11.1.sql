set serveroutput on
CREATE OR REPLACE PROCEDURE Cal_Int(
    p_principal IN NUMBER,
    p_rate IN NUMBER,
    p_years IN NUMBER,
    p_interest OUT NUMBER
) AS
BEGIN
   
    p_interest := (p_principal * p_rate * p_years) / 100;
END Cal_Int;
/


set serveroutput on
DECLARE
    principal NUMBER := &principal; 
    interest NUMBER := &interest;     
    years NUMBER := &years;        
    cal_interest NUMBER;

BEGIN
    Cal_Int(principal, interest,years, cal_interest);
    DBMS_OUTPUT.PUT_LINE('Simple Interest: ' || cal_interest);
END;
/
