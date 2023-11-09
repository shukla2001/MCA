CREATE OR REPLACE FUNCTION Cal_proj(department_id IN dept.dno%TYPE) RETURN NUMBER IS
    v_total_fund NUMBER := 0;
BEGIN
    SELECT SUM(p.prj_fund)
    INTO v_total_fund
    FROM proj p
    WHERE p.dno = department_id;

    RETURN v_total_fund;
END Cal_proj;
/


DECLARE
    v_deptno dept.dno%TYPE;
    v_total_fund NUMBER;
    CURSOR dept_cursor IS
        SELECT dno, dname FROM dept;
BEGIN
    FOR dept_rec IN dept_cursor LOOP
        v_deptno := dept_rec.dno;
        v_total_fund := Cal_Proj(v_deptno);
        DBMS_OUTPUT.PUT_LINE(dept_rec.dname || ' department has received Rs. ' || v_total_fund || '/-');
    END LOOP;
END;
/