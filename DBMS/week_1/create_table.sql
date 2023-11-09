Create table DEPT(
DNO varchar2(3) constraint DNO_UNQ_CONS UNIQUE constraint D_Like_DNO_Cons CHECK( DNO LIKE 'D%'),
DNAME varchar2(10) constraint DNAME_UNQ_Cons UNIQUE,
Location varchar2(9) constraint VALID_LOC_Cons CHECK(Location IN ('BNG','MNG','MUB','HYD','CHN')));

Create table EMP(
EMPNO Number(4) Primary key,
ENAME varchar2(10),
JOB varchar2(9) Constraint JOB_CHK_Cons CHECK(JOB IN ('CLRK','MGR','A.MGR','GM','CEO')),
MGRID Number(4) Constraint MGR_FK_EMPNO_Cons REFERENCES EMP,
DATE_BIRTH DATE,
SAL Number(7,2) Constraint SAL_20KMore_Cons CHECK(SAL>20000),
COMM Number(7,2) DEFAULT 1000,
DEPTNO varchar2(3) Constraint DEPTNO_FK_DEPT_Cons References DEPT(DNO) on delete cascade,
DATE_JOIN DATE,
Constraint DB_Less_DBJOIN_Cons CHECK(DATE_BIRTH<DATE_JOIN));


Create table PROJ(
DNO varchar2(3) Constraint DNO_FK_DEPT_cons References DEPT(DNO) NOT NULL,
PRJ_NO varchar2(5) Constraint P_LIKEPRJNO_CONS CHECK(PRJ_NO LIKE'P') NOT NULL,
PRJ_NAME varchar2(10),
PRJ_CREDIT Number(2) Constraint PRJ_CREDIT_RANGE_Cons Check(PRJ_CREDIT BETWEEN 1 AND 10),
STRT_DATE DATE,
END_DATE DATE, Constraint ENDDATE_GRT_STRT_Cons CHECK(END_DATE>STRT_DATE)); 

Alter table PROJ ADD Primary Key(DNO,PRJ_No);
alter table EMP ADD(PRJ_ID varchar(5));

alter table EMP ADD CONSTRAINT DEPTNO_FK_DEPT_Cons1 FOREIGN KEY(DEPTNO,PRJ_ID)
REFERENCES PROJ;

