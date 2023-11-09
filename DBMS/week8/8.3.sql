set serveroutput on
declare
v_job emp.job%type:='&job';
v_deptno emp.deptno%type:='&dept';
v_ename emp.ename%type;
cursor details(p_job emp.job%type,p_deptno emp.deptno%type) is select ename from emp where job=p_job and deptno=p_deptno ;
begin
open details(v_job,v_deptno);
loop
fetch details into v_ename;
exit when details%notfound;
dbms_output.put_line(v_ename);
end loop;
end;
/
