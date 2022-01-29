-- grant and revoke statements

create table departments ( dept_no number(10), dept_name varchar2(20), dept_location varchar2(20));

create table employees ( emp_id number(10), emp_name varchar2(20), emp_salary varchar2(20));

CREATE USER john IDENTIFIED BY abcde;

Grant all on employees to abcde;

Grant select , update , insert on departments to abcde with grant option;

Revoke all on employees from abcde;

Revoke select , update , insert on departments from abcde;