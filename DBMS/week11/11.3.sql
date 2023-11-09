func1:
CREATE OR REPLACE FUNCTION Cal_Age(date_of_birth IN DATE) RETURN NUMBER IS
    v_age NUMBER;
BEGIN
    v_age := FLOOR(MONTHS_BETWEEN(SYSDATE, date_of_birth) / 12);
    RETURN v_age;
END Cal_age;
/

func2:
CREATE OR REPLACE FUNCTION Cal_Exp(join_date IN DATE) RETURN NUMBER IS
    v_exp NUMBER;
BEGIN
    v_exp := FLOOR(MONTHS_BETWEEN(SYSDATE, join_date) / 12);
    RETURN v_exp;
END Cal_Exp;
/


DECLARE
	e_no emp.empno%type;
	name emp.ename%type;
	dob emp.date_birth%type;
	join_d emp.date_join%type;
    v_age number(10,2);
	v_exp number(10,2);

begin
	e_no := &Employee_Number;
	select ename,date_birth,date_join into name,dob,join_d from emp where empno = e_no;
	v_age := Cal_Age(dob);
	v_exp := Cal_Exp(join_d);
	dbms_output.put_line('Ename' || '---' || 'AGE' || '---' || 'Service');
	dbms_output.put_line( name || '---' || v_age || '---' || v_exp);
END;
/




