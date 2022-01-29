SQL> create table ityr(ename varchar(15),eid number(5),salary number(5));

Table created.

SQL> set serveroutput on;
SQL> declare
  2  t number(6);
  3  n number(6);
  4  s number(6);
  5  begin
  6  insert into ityr values ('a',100,19000);
  7  insert into ityr values ('b',102,1000);
  8  s:= &s;
  9  n:= &n;
 10  savepoint a;
 11  update ityr set salary = salary + 2000 where eid = s;
 12  update ityr set salary = salary + 1500 where eid = n;
 13  select sum(salary) into t from ityr;
 14  if (t > 20000)
 15  then
 16  rollback to a;
 17  else
 18  dbms_output.put_line('no updation');
 19  end if;
 20  end;
 21  /
 
/*
output:
Enter value for s: 100
old   8: s:= &s;
new   8: s:= 100;
Enter value for n: 102
old   9: n:= &n;
new   9: n:= 102;
*/


PL/SQL procedure successfully completed.

SQL> select * from ityr;

ENAME                  EID     SALARY
--------------- ---------- ----------
a                      100      19000
b                      102       1000