set serveroutput on
declare
v_ename emp.ename%type;
v_sal emp.sal%type;
cursor details is select ename, sal from emp where sal>30000;
begin
open details;
loop
fetch details into v_ename, v_sal;
exit when details%notfound;
dbms_output.put_line(v_ename||' '||v_sal);
end loop;
end;
/