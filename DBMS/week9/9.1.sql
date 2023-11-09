SET SERVEROUTPUT ON;

DECLARE
    e_rec emp%rowtype;
    numeric_error Exception;
    pragma exception_init(numeric_error, -06502);
BEGIN
    select * into e_rec from emp where empno = &empno;
    dbms_output.put_line('Empno: ' || e_rec.empno || ' Ename: ' || e_rec.ename || ' Salary: ' || e_rec.sal);
    dbms_output.put_line('Ename to number ' || to_number(e_rec.ename));
EXCEPTION
    WHEN numeric_error THEN
        dbms_output.put_line('Invalid number format exception');
    WHEN no_data_found THEN
        dbms_output.put_line('No employee with the given empno found');
    WHEN too_many_rows THEN
        dbms_output.put_line('There are redundancies of empno');
END;
/
