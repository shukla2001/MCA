set severoutput on;
DECLARE
    v_sal emp.sal%type;
    v_ename emp.ename%type;
    v_dname dept.dname%type;
    v_empno emp.empno%type;
BEGIN
    v_empno := &v_empno;
    SELECT empno,ename, dname,sal INTO v_empno,v_ename,v_dname,v_sal FROM emp,dept WHERE empno = v_empno and emp.deptno=dept.dno;
    dbms_output.put_line(v_ename||' works in '||v_dname||' department and draws '||v_sal||'/- as salary.');
END;
/