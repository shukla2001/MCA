
create table emp(empno number(4) primary key, ename varchar(10), job varchar(9) constraint job_chk_cons check (job in ('CLRK','MGR','A.MGR','GM','CEO')), Mgrid number(4) constraint mgr_fk_empno_cons references emp, date_birth date,sal number(7,2) constraint sal_20kmore_cons check(sal>20000),comm number(7,2) default '1000', deptno varchar(30) constraint deptno_fk_dept_cons references dept(dno) on delete cascade, date_join date, constraint db_less_dbjoin_cons check(date_birth< date_join),
Prj_id varchar(5));