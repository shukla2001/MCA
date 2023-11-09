set serveroutput on;
CREATE OR REPLACE TRIGGER additional_fund_trigger
AFTER UPDATE ON proj
FOR EACH ROW
DECLARE
    v_project_duration NUMBER;
    v_additional_fund NUMBER;
    v_message VARCHAR2(200);
BEGIN
    -- Calculate project duration lapsed
    v_project_duration := (SYSDATE - :OLD.strt_date);

    -- Calculate additional fund based on criteria
    IF v_project_duration < (:NEW.end_date - :OLD.strt_date) * 0.5 THEN
        v_additional_fund := :NEW.Prj_fund * 0.7;
        v_message := 'You are eligible for Rs. ' || TO_CHAR(v_additional_fund, '999999.99');
    ELSE
        v_additional_fund := :NEW.Prj_fund * 0.4;
        v_message := 'You are eligible for Rs. ' || TO_CHAR(v_additional_fund, '999999.99');
    END IF;

    -- Display the eligibility message
    DBMS_OUTPUT.PUT_LINE(v_message);
END;
/


select * from proj;

update proj set prj_fund = prj_fund + 50000 where dno='D2';

select * from proj;