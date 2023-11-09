set serveroutput on;
set verify off;

DECLARE
    e_rec emp%rowtype;
   
BEGIN

    select * into e_rec from emp where empno=&empno or deptno='&dno';
    dbms_output.put_line('Empno: '||e_rec.empno||'Ename: '||e_rec.ename||'Salary: '||e_rec.sal);
    dbms_output.put_line('Ename to number'||to_number(e_rec.ename));
EXCEPTION
    when value_error THEN dbms_output.put_line('Invalid number format exception');
   
    when no_data_found then
        dbms_output.put_line('no employee with given empno found');
    when too_many_rows then
        dbms_output.put_line('there are redundacy of empno');
end;
/


SET SERVEROUTPUT ON;

DECLARE
    e_rec emp%ROWTYPE;
    empno_input NUMBER;
    dno_input emp.deptno%type;
BEGIN
    -- Prompt the user for input
    empno_input := &empno;
    dno_input := &deptno;
    
    -- Use the input values in the SQL query
    SELECT * INTO e_rec FROM emp WHERE empno = empno_input OR deptno = dno_input;
    
    -- Rest of your code here
    DBMS_OUTPUT.PUT_LINE('Empno: ' || e_rec.empno || ' Ename: ' || e_rec.ename || ' Salary: ' || e_rec.sal);
    DBMS_OUTPUT.PUT_LINE('Ename to number ' || TO_NUMBER(e_rec.ename));
EXCEPTION
    WHEN VALUE_ERROR THEN DBMS_OUTPUT.PUT_LINE('Invalid number format exception');
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee with given empno found');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('There are redundancies of empno');
END;
/
