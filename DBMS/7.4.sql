set serveroutput on;
declare
v_emp emp%rowtype;
v_empno emp.empno%type;
v_empsal empsal%rowtype;
BEGIN
select * into v_emp from emp where empno=&v_empno;
v_empsal.hra:=v_emp.sal*0.5;
v_empsal.da:=v_emp.sal*0.2;
v_empsal.gross:=v_empsal.hra+v_empsal.da;
v_empsal.pf:=v_emp.sal*0.12;
v_empsal.net:=v_empsal.gross-v_empsal.pf;
INSERT into empsal VALUES(v_emp.empno,v_emp.ename,v_emp.sal,v_empsal.hra,v_empsal.da,v_empsal.pf,v_empsal.gross,v_empsal.net);
Dbms_output.put_line('Record inserted successfully');
END;
/