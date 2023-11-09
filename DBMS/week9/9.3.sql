set serveroutput on
declare
    v_empno emp.empno%type := &empno;
    v_ename emp.ename%type;
    v_sal emp.sal%type;

    ex_sal exception;
begin
    select ename, sal into v_ename, v_sal from emp where empno = v_empno;
    dbms_output.put_line('Empno= '||v_empno);
    dbms_output.put_line('Name= '||v_ename);
    dbms_output.put_line('Salary= '||v_sal);
    if v_sal > 25000 then
        raise ex_sal;
    end if;
    if v_sal < 25000 then
        update emp set sal = 25000 where empno = v_empno;
    end if;

exception
    when ex_sal then
        dbms_output.put_line('Salary should be < 25000');
    when no_data_found then
        dbms_output.put_line('Enter a Valid EmpNo');
end;
/