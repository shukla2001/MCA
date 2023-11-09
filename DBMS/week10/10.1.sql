create table sal_mod(
	emp_no number(4),
	dname varchar2(20),
	old_sal number(11,2),
	mod_date date,
	modifier varchar(20)
);

-- CREATE OR REPLACE TRIGGER sal_up
-- AFTER UPDATE OF sal ON emp
-- FOR EACH ROW
-- DECLARE
--    dept_name dept.dname%TYPE;
-- BEGIN
--    SELECT dname INTO dept_name FROM dept WHERE dno = :old.deptno;
--    IF UPDATING ('sal') THEN
--        DBMS_OUTPUT.PUT_LINE('Emp no = ' || :old.empno || '-- Old salary = ' || :old.sal || '-- New salary = '
--        || :new.sal || ' Department = ' || dept_name);
--        INSERT INTO sal_mod VALUES(:old.empno, dept_name, :old.sal, SYSDATE, USER);
--    END IF;
-- END;
-- /



set serveroutput on;
create or replace trigger sal_up after update of sal on emp for each row

declare
	dept_name dept.dname%type;
begin
	select dname into dept_name from dept where dno = :old.deptno;
	if updating ('sal') then
		dbms_output.put_line('Emp no = ' || :old.emp_no || '-- Old salary = ' || :old.sal || '-- New salary = '
		|| :new.sal || ' Department = ' || dept_name);
		insert into sal_mod values(:old.emp_no,dept_name,:old.sal,sysdate,user);
	end if;
end;
/


update emp set sal = 125000 where empno = 125;

select * from sal_mod;

select * from emp;


