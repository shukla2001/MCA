set serveroutput on
declare
v_empno emp.empno%type;
v_ename emp.ename%type;
v_sal emp.sal%type;
v_hra empsal1.hra%type;
v_da empsal1.da%type;
v_pf empsal1.pf%type;
v_gross_sal empsal1.gross_sal%type;
v_net_sal empsal1.net_sal%type;

begin
v_empno := &empno;

select ename, sal into v_ename, v_sal from emp where empno = v_empno;

v_hra := .50 * v_sal;
v_da := .20 * v_sal;
v_pf := .12 * v_sal;
v_gross_sal := v_sal + v_hra + v_da;
v_net_sal := v_gross_sal - v_pf;

insert into empsal values(v_empno, v_ename, v_sal, v_hra, v_da, v_gross_sal, v_pf, v_net_sal);

end;
/

