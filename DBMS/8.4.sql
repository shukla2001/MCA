set serveroutput on;
DECLARE
    c int:=1;
    v_sal emp.sal%type:=0;
    cursor cur_emp(pid varchar2) is select ename,sal,dname from emp,dept where deptno=dno and prj_id=pid 
    order by sal desc;
BEGIN
    for i in cur_emp(upper('&pid')) loop
        exit when cur_emp%notfound or (c>2 and v_sal<>i.sal);
        if c>1 then
            v_sal:=i.sal;
        end if;
        c:=c+1;
        dbms_output.put_line(i.ename||'     '||i.sal||'     '||i.dname);
    end loop;
end;
/
