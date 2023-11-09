create table dept(dno varchar(3) constraint dno_unq_cons unique constraint d_likedno_cons check(dno like 'D%'),
dname varchar(10) constraint dname_unq_cons unique,
location varchar(9) constraint valid_loc_cons check(location in('BNG', 'MNG', 'MUM', 'HYD', 'CHN')),
dept_budget number(7));