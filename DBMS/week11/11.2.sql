CREATE OR REPLACE PROCEDURE display_proj
(dept_name IN dept.dno%type)
AS
    v_dept_id VARCHAR2(3); -- Match the data type of dno
BEGIN
    -- Find the department ID based on the given department name
    SELECT dno
    INTO v_dept_id
    FROM dept
    WHERE dname = dept_name;

    -- Cursor to fetch project and employee information
    FOR project_rec IN (
        SELECT p.prj_name, e.ename
        FROM proj p
        JOIN emp e ON p.prj_no = e.prj_id
        WHERE p.dno = v_dept_id
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Project: ' || project_rec.prj_name);
        DBMS_OUTPUT.PUT_LINE('Employee: ' || project_rec.ename);
    END LOOP;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Department not found: ' || dept_name);
END display_proj;
/



 execute display_proj('HR');