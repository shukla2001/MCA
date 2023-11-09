CREATE OR REPLACE TRIGGER weekday
BEFORE INSERT OR UPDATE OR DELETE ON emp
FOR EACH ROW
DECLARE
    v_day VARCHAR2(20);
BEGIN
    SELECT TO_CHAR(SYSDATE, 'D') INTO v_day FROM DUAL;
    IF v_day IN ('6', '7') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Operations not allowed on weekends.');
    END IF;
    DBMS_OUTPUT.PUT_LINE('User ' || USER || ' initiated the operation on ' || TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'));
END;
/


UPDATE emp SET sal = 21000 WHERE empno = 106;

(output it will show a error- system error - 20001)


